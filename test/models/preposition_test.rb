require 'test_helper'

class PrepositionTest < ActiveSupport::TestCase
  
  test "the that it is preposition" do
    assert Preposition.new.preposition?
  end

end