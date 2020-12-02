# frozen_string_literal: true

class PuppetCatalogTest::Filter
  attr_accessor :include_pattern, :exclude_pattern

  def initialize(include_pattern = PuppetCatalogTest::DEFAULT_FILTER, exclude_pattern = nil)
    @include_pattern = include_pattern
    @exclude_pattern = exclude_pattern
  end
end
