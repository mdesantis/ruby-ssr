# frozen_string_literal: true

require "test_helper"

class TestSSR < Minitest::Test
  def test_that_it_defines_the_proper_module
    assert_equal "constant", defined?(SSR)
    assert_kind_of Module, SSR
  end

  def test_that_it_has_a_version_number
    refute_nil ::SSR::VERSION
  end
end
