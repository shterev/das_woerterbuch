require 'test_helper'

class WordTest < ActiveSupport::TestCase

  test "that the default specifics value is an empty hash" do
    assert Word.new.specifics.kind_of?(Hash)
  end

  test "the base class should not have type" do
    word = Word.new

    assert_not word.adjective?
    assert_not word.adverb?
    assert_not word.conjunction?
    assert_not word.interjunction?
    assert_not word.noun?
    assert_not word.preposition?
    assert_not word.pronoun?
    assert_not word.verb?
  end

  test "has specifics setters and getters" do
    Word.inheritors.each do |word_inheritor|
      eval("#{word_inheritor}.specifics").each do |specific|
        word = eval("#{word_inheritor}.new")

        assert word.respond_to?("#{specific}"),  "It is expected the #{word_inheritor} class to have `#{specific}` method."
        assert word.respond_to?("#{specific}="), "It is expected the #{word_inheritor} class to have `#{specific}=` method."

        word.send("#{specific}=", "#{specific}_value")
        assert word.send("#{specific}") == "#{specific}_value"
      end
    end
  end

  test "specifics should be empty array if no defined" do
    assert Preposition.specifics == []
  end

end