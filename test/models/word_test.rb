require 'test_helper'

class WordTest < ActiveSupport::TestCase

  test "that the default specifics value is an empty hash" do
    assert Word.new.specifics.kind_of?(Hash)
  end

  test "has specifics setters and getters" do
    Word.inheritors.each do |word_inheritor|
      eval("#{word_inheritor}.specifics").each do |specific|
        assert eval("#{word_inheritor}.new").respond_to?("#{specific}"),  "It is expected the #{word_inheritor} class to have `#{specific}` method."
        assert eval("#{word_inheritor}.new").respond_to?("#{specific}="), "It is expected the #{word_inheritor} class to have `#{specific}=` method."
      end
    end
  end

  test "specifics should be empty array if no defined" do
    assert Preposition.specifics == []
  end

end