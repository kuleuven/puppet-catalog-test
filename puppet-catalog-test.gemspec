# -*- encoding: utf-8 -*-
# stub: puppet-catalog-test 0.4.0.pre ruby lib

Gem::Specification.new do |s|
  s.name = "puppet-catalog-test"
  s.version = "0.4.0.pre"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Rene Lengwinat"]
  s.date = "2015-11-24"
  s.description = "Test all your puppet catalogs for compiler warnings and errors."
  s.email = "rene.lengwinat@googlemail.com"
  s.executables = ["puppet-catalog-test"]
  s.files = ["LICENSE", "README.md", "Rakefile", "bin/puppet-catalog-test", "lib/puppet-catalog-test", "lib/puppet-catalog-test.rb", "lib/puppet-catalog-test/filter.rb", "lib/puppet-catalog-test/junit_xml_reporter.rb", "lib/puppet-catalog-test/puppet_adapter", "lib/puppet-catalog-test/puppet_adapter/base_puppet_adapter.rb", "lib/puppet-catalog-test/puppet_adapter/puppet_3x_adapter.rb", "lib/puppet-catalog-test/puppet_adapter/puppet_4x_adapter.rb", "lib/puppet-catalog-test/puppet_adapter_factory.rb", "lib/puppet-catalog-test/rake_task.rb", "lib/puppet-catalog-test/stdout_reporter.rb", "lib/puppet-catalog-test/test_case.rb", "lib/puppet-catalog-test/test_runner.rb", "puppet-catalog-test.gemspec"]
  s.homepage = "https://github.com/invadersmustdie/puppet-catalog-test/"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.0"
  s.summary = "Test all your puppet catalogs for compiler warnings and errors"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<puppet>, [">= 0"])
      s.add_runtime_dependency(%q<parallel>, [">= 0"])
      s.add_runtime_dependency(%q<builder>, [">= 0"])
    else
      s.add_dependency(%q<puppet>, [">= 0"])
      s.add_dependency(%q<parallel>, [">= 0"])
      s.add_dependency(%q<builder>, [">= 0"])
    end
  else
    s.add_dependency(%q<puppet>, [">= 0"])
    s.add_dependency(%q<parallel>, [">= 0"])
    s.add_dependency(%q<builder>, [">= 0"])
  end
end
