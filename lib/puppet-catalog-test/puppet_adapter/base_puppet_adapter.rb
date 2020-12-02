# frozen_string_literal: true

require 'puppet'
require 'tmpdir'

class PuppetCatalogTest::BasePuppetAdapter
  def initialize(config)
    @config = config
  end

  def init_config
    config = @config
    manifest_path = config[:manifest_path]
    module_paths = config[:module_paths]
    config_dir = config[:config_dir]
    hiera_config = config[:hiera_config]
    verbose = config[:verbose]
    environment = config[:environment] || 'production'

    raise ArgumentError, '[ERROR] manifest_path must be specified' unless manifest_path
    raise ArgumentError, "[ERROR] manifest_path (#{manifest_path}) does not exist" unless FileTest.exist?(manifest_path)

    raise ArgumentError, '[ERROR] module_path must be specified' unless module_paths

    module_paths.each do |mp|
      raise ArgumentError, "[ERROR] module_path (#{mp}) does not exist" unless FileTest.directory?(mp)
    end

    Puppet.settings.handlearg('--confdir', config_dir) if config_dir

    if verbose
      Puppet::Util::Log.newdestination(:console)
      Puppet::Util::Log.level = :debug
    end

    Puppet.settings.handlearg('--config', '.')
    Puppet.settings.handlearg('--manifest', manifest_path)

    module_path = module_paths.join(':')

    Puppet.settings.handlearg('--modulepath', module_path)
    Puppet.settings.handlearg('--vardir', Dir.mktmpdir)
    Puppet.settings.handlearg('--environment', environment)

    if hiera_config
      raise ArgumentError, "[ERROR] hiera_config  (#{hiera_config}) does not exist" unless FileTest.exist?(hiera_config)

      Puppet.settings[:hiera_config] = hiera_config
    end
    env = Puppet::Node::Environment.create(environment, [module_path], manifest_path)
    loader = Puppet::Environments::Static.new(env)

    Puppet.push_context(
      {
        environments: loader,
        current_environment: env,
      },
      'Setup puppet-catalog-test environments',
    )
  end

  def parser; end

  def compile(node); end

  def create_node(hostname, facts); end

  def version; end

  def prepare; end

  def cleanup; end
end
