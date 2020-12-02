# frozen_string_literal: true

require 'rake'
require 'rake/tasklib'

class PuppetCatalogTest::RakeTask < ::Rake::TaskLib
  include ::Rake::DSL if defined?(::Rake::DSL)

  attr_accessor :config_dir, :exclude_pattern, :facts, :include_pattern, :manifest_path, :module_paths, :parser, :reporter, :scenario_yaml, :verbose, :environment

  def initialize(name, &task_block)
    super()
    desc 'Compile all puppet catalogs' unless ::Rake.application.last_description

    task name do
      task_block&.call(self)
      setup
    end
  end

  def setup
    puppet_config = {
      config_dir: @config_dir,
      manifest_path: @manifest_path,
      module_paths: @module_paths,
      parser: @parser,
      verbose: @verbose,
      environment: @environment,
    }

    puppet_config[:hiera_config] = File.join(@config_dir, 'hiera.yaml') if @config_dir

    pct = PuppetCatalogTest::TestRunner.new(puppet_config)

    @filter = PuppetCatalogTest::Filter.new

    @filter.include_pattern = @include_pattern if @include_pattern
    @filter.exclude_pattern = @exclude_pattern if @exclude_pattern

    if @scenario_yaml
      pct.load_scenario_yaml(@scenario_yaml, @filter)
    else
      nodes = pct.collect_puppet_nodes(@filter)
      test_facts = @facts || fallback_facts

      nodes.each do |nodename|
        facts = test_facts.merge({
                                   'hostname' => nodename,
                                   'fqdn' => "#{nodename}.localdomain",
                                 })

        pct.add_test_case(nodename, facts)
      end
    end

    pct.reporter = @reporter if @reporter

    pct.run_tests!
  end

  private

  def fallback_facts
    {
      'architecture' => 'x86_64',
      'ipaddress' => '127.0.0.1',
      'local_run' => 'true',
      'disable_asserts' => 'true',
      'interfaces' => 'eth0',
    }
  end
end
