require 'test_helper'

class PronounTest < ActiveSupport::TestCase

  test "the that it is Pronoun" do
    assert Pronoun.new.pronoun?
  end

end