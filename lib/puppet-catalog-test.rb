# frozen_string_literal: true

module PuppetCatalogTest
  VERSION = '0.4.5'

  DEFAULT_FILTER = /.*/.freeze

  require 'puppet-catalog-test/filter'
  require 'puppet-catalog-test/test_runner'
  require 'puppet-catalog-test/rake_task'
end
