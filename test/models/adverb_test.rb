require 'test_helper'

class AdverbTest < ActiveSupport::TestCase

  test "the that it is adverb" do
    assert Adverb.new.adverb?
  end

end