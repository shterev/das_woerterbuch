require 'test_helper'

class AdjectiveTest < ActiveSupport::TestCase

  test "the that it is adjective" do
    assert Adjective.new.adjective?
  end

end