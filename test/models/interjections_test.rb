require 'test_helper'

class InterjectionTest < ActiveSupport::TestCase

  test "the that it is Interjection" do
    assert Interjection.new.interjection?
  end

end