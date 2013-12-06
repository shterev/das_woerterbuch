require 'test_helper'

class ConjunctionTest < ActiveSupport::TestCase

  test "the that it is conjunction" do
    assert Conjunction.new.conjunction?
  end

end