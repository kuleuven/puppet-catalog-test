# frozen_string_literal: true

source 'https://rubygems.org'

puppet_version = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 2.7']
parallel_version = RUBY_VERSION.start_with?('1.8') ? '= 1.3.3' : nil
rake_version = RUBY_VERSION.start_with?('1.8') ? '= 10.5.0' : nil

# FIXME: get rid of this pattern magic ..
gem 'safe_yaml' if RUBY_VERSION =~ /^2\.(2|3)\./ && puppet_version =~ /^= 3.(7|8)\./

gem 'builder'
gem 'parallel', parallel_version
gem 'puppet', puppet_version
gem 'rake', rake_version
gem 'rubocop'
gem 'rubocop-rake'
gem 'rubocop-rspec'

gem 'json_pure', '= 1.8.3' if RUBY_VERSION.start_with?('1.8')

gem 'hiera'
gem 'hiera-puppet'

group :test do
  gem 'mocha', '~> 0.13', require: false

  gem 'test-unit' if RUBY_VERSION =~ /^2\.(2|3)/
end
