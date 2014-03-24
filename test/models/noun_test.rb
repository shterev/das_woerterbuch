require 'test_helper'

class NounTest < ActiveSupport::TestCase

  test "the that it is Noun" do
    assert Noun.new.noun?
  end

end