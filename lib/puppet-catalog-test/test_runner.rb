# frozen_string_literal: true

require 'yaml'
require 'parallel'

require 'puppet-catalog-test/test_case'
require 'puppet-catalog-test/stdout_reporter'
require 'puppet-catalog-test/puppet_adapter_factory'

class PuppetCatalogTest::TestRunner
  attr_accessor :exit_on_fail, :reporter

  attr_reader :test_cases, :total_duration

  def initialize(puppet_config, stdout_target = $stdout)
    raise ArgumentError, 'No puppet_config hash supplied' unless puppet_config

    @test_cases = []
    @exit_on_fail = true
    @out = stdout_target
    @puppet_adapter = PuppetCatalogTest::PuppetAdapterFactory.create_adapter(puppet_config)

    if puppet_config[:xml]
      require 'puppet-catalog-test/junit_xml_reporter'
      @reporter = PuppetCatalogTest::JunitXmlReporter.new('puppet-catalog-test', 'puppet_catalogs.xml')
    else
      @reporter = PuppetCatalogTest::StdoutReporter.new(stdout_target)
    end

    @total_duration = nil
  end

  def load_scenario_yaml(yaml_file, filter = nil)
    scenarios = YAML.load_file(yaml_file)

    scenarios.each do |tc_name, facts|
      next if tc_name =~ /^__/

      if filter
        next if filter.exclude_pattern && tc_name.match(filter.exclude_pattern)
        next if filter.include_pattern && !tc_name.match(filter.include_pattern)
      end

      add_test_case(tc_name, facts)
    end
  end

  def load_all(filter = Filter.new, facts = {})
    nodes = collect_puppet_nodes(filter)

    nodes.each do |n|
      node_facts = facts.dup

      node_facts['fqdn'] = n unless node_facts.key?('fqdn')

      add_test_case(n, node_facts)
    end
  end

  def add_test_case(tc_name, facts)
    tc = PuppetCatalogTest::TestCase.new
    tc.name = tc_name
    tc.facts = facts

    @test_cases << tc
  end

  def compile_catalog(node_fqdn, facts = {})
    hostname = node_fqdn.split('.').first
    facts['hostname'] = hostname

    node = @puppet_adapter.create_node(hostname, facts)

    @puppet_adapter.compile(node)
  end

  def collect_puppet_nodes(filter)
    nodes = @puppet_adapter.nodes

    nodes.delete_if { |node| node.match(filter.exclude_pattern) } if filter.exclude_pattern

    nodes.delete_if { |node| !node.match(filter.include_pattern) } if filter.include_pattern

    nodes
  end

  def run_tests!
    @out.puts "[INFO] Using puppet #{@puppet_adapter.version}"

    run_start = Time.now
    proc_count = Parallel.processor_count

    processed_test_cases = Parallel.map(@test_cases, in_processes: proc_count) do |tc|
      begin
        tc_start_time = Time.now

        raise "fact 'fqdn' must be defined" if tc.facts['fqdn'].nil?

        compile_catalog(tc.facts['fqdn'], tc.facts)
        tc.duration = Time.now - tc_start_time

        tc.passed = true

        @reporter.report_passed_test_case(tc)
      rescue StandardError => e
        if $DEBUG
          p e
          puts e.backtrace
        end

        tc.duration = Time.now - tc_start_time
        tc.error = e.message
        tc.passed = false

        @reporter.report_failed_test_case(tc)
      end

      tc
    end

    @test_cases = processed_test_cases

    @total_duration = Time.now - run_start

    @reporter.summarize(self)

    if test_cases.any? { |tc| tc.passed == false }
      exit 1 if @exit_on_fail
      return false
    end

    true
  end
end
