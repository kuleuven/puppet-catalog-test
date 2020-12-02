# frozen_string_literal: true

require 'rake/testtask'
require 'bundler/gem_tasks'
require 'puppet/version'
require 'rubygems'
require 'yaml'
require 'erb'
require 'rubocop/rake_task'

desc 'Clean workspace'
task :clean do
  sh 'rm -vrf *.gem pkg/'
  sh 'rm test/cases/working-with-hiera/hiera.yaml'
  sh 'rm test/cases/failing-with-hiera/hiera.yaml'
end

desc 'Fix permissions'
task :pre_release do
  sh 'chmod -R a+r lib'
  sh 'chmod a+r puppet-catalog-test.gemspec'
  sh 'chmod a+rx bin/puppet-catalog-test'
  sh 'chmod a+r Rakefile README.md'

  puts "=> Don't forget to adjust versions"
  sh 'grep -r VERSION lib'
  sh 'grep version puppet-catalog-test.gemspec'
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

desc 'Run RuboCop style checks'
task :rubocop do
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
end

task :test_integration do
  base_dir = Dir.pwd
  all_tests_green = true

  Dir['test/**/Rakefile'].each do |rf|
    supposed_to_fail = rf.include?('failing')
    supposed_to_fail = Gem::Version.new(Puppet.version) > Gem::Version.new('3.2.0') if rf.include?('future-parser')
    Dir.chdir rf.split('/')[0..-2].join('/')

    ['catalog:scenarios', 'catalog:all'].each do |tc|
      tc_name = "#{rf} / #{tc}"
      puts " * Running scenario: #{tc_name} ]"

      exit_code = -1
      captured_output = ''

      if FileTest.exist?('hiera.yaml.erb')
        template = ERB.new(File.read('hiera.yaml.erb'))
        working_directory = File.join(File.dirname(__FILE__), File.dirname(rf))

        File.open('hiera.yaml', 'w') do |fp|
          fp.puts template.result(binding)
        end
      end

      IO.popen("bundle exec rake #{tc}") do |io|
        while (line = io.gets)
          captured_output << line
        end

        io.close
        exit_code = $CHILD_STATUS
      end

      if (supposed_to_fail && exit_code != 0) || (!supposed_to_fail && exit_code.zero?)
        puts "    WORKED (supposed_to_fail = #{supposed_to_fail})"
      else
        all_tests_green = false
        puts "\tScenario: #{tc_name} FAILED (supposed_to_fail = #{supposed_to_fail})"
        puts '>>>>>>>>>>>>>'
        puts captured_output
        puts '<<<<<<<<<<<<<'
      end
    end

    Dir.chdir base_dir
  end

  raise unless all_tests_green
end

task :generate_test_matrix do
  # rbenv doesn't support fuzzy version matching, so we are using a good old mapping table
  ruby_version_mapping = {
    '1.8.7' => '1.8.7-p374',
    '1.9.3' => '1.9.3-p551',
    '2.0.0' => '2.0.0-p645',
  }

  config = YAML.load_file('.travis.yml')
  checks = []

  config['rvm'].each do |ruby_version|
    config['env'].each do |env_var|
      next if config['matrix']['exclude'].detect { |ex| ex['rvm'] == ruby_version && ex['env'] == env_var }

      puppet_version = env_var.match(/^PUPPET_VERSION=(.*)$/)[1]
      mapped_ruby_version = ruby_version_mapping[ruby_version] || ruby_version
      checks << "check #{mapped_ruby_version} #{puppet_version}"
    end
  end

  template = ERB.new(File.read('run-all-tests.erb'))
  File.open('run-all-tests', 'w+') { |fp| fp.puts template.result(binding) }
end

task default: %i[test test_integration]
