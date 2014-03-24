require 'test_helper'

class VerbTest < ActiveSupport::TestCase

  test "the that it is Verb" do
    assert Verb.new.verb?
  end

end