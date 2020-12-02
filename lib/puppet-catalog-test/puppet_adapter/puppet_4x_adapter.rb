# frozen_string_literal: true

require 'puppet'

class PuppetCatalogTest::Puppet4xAdapter < PuppetCatalogTest::BasePuppetAdapter
  def initialize(config)
    super(config)

    @env = Puppet.lookup(:current_environment)
                 .override_with(manifest: config[:manifest_path])
                 .override_with(modulepath: config[:module_paths])

    @env.each_plugin_directory do |dir|
      $LOAD_PATH << dir unless $LOAD_PATH.include?(dir)
    end

    require 'puppet/test/test_helper'

    Puppet::Test::TestHelper.initialize
    Puppet::Test::TestHelper.before_all_tests
  end

  def version
    Puppet.version
  end

  def nodes
    @env.known_resource_types.nodes.keys
  end

  def create_node(hostname, facts)
    Puppet::Test::TestHelper.before_each_test
    init_config
    node = Puppet::Node.new(hostname, facts: Puppet::Node::Facts.new('facts', facts))
    node.merge(facts)
    node
  end

  def compile(node)
    Puppet::Parser::Compiler.compile(node)
  rescue StandardError => e
    raise e
  ensure
    Puppet::Test::TestHelper.after_each_test
  end
end
