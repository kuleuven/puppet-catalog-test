# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'puppet-catalog-test'
  s.version = '0.4.5'
  s.homepage = 'https://github.com/invadersmustdie/puppet-catalog-test/'
  s.summary = 'Test all your puppet catalogs for compiler warnings and errors'
  s.description = 'Test all your puppet catalogs for compiler warnings and errors.'

  s.executables = ['puppet-catalog-test']

  s.files = [
    'bin/puppet-catalog-test',
    'LICENSE',
    'Rakefile',
    'README.md',
    'puppet-catalog-test.gemspec',
  ]

  s.files += Dir['lib/**/*']

  s.add_dependency 'builder'
  s.add_dependency 'parallel'
  s.add_dependency 'puppet'

  s.authors = ['Rene Lengwinat']
  s.email = 'rene.lengwinat@googlemail.com'
  s.license = 'MIT'
  s.required_ruby_version = '>= 2.6.0'
end
