# frozen_string_literal: true

require 'builder'

class PuppetCatalogTest::JunitXmlReporter < PuppetCatalogTest::StdoutReporter
  # rubocop:disable Lint/MissingSuper
  def initialize(project_name, report_file)
    @project_name = project_name
    @report_file = report_file

    target_dir = File.dirname(report_file)

    FileUtils.mkdir_p(target_dir)

    @out = $stdout
  end
  # rubocop:enable Lint/MissingSuper

  def summarize(test_run)
    failed_nodes = test_run.test_cases.select { |tc| tc.passed == false }
    builder = Builder::XmlMarkup.new

    xml = builder.testsuite(failures: failed_nodes.size, tests: test_run.test_cases.size) do |ts|
      test_run.test_cases.each do |tc|
        ts.testcase(classname: @project_name, name: tc.name, time: tc.duration) do |tc_node|
          tc_node.failure tc.error if tc.error
        end
      end
    end

    File.open(@report_file, 'w') do |fp|
      fp.puts xml
    end
  end
end
