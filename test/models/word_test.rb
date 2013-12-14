require 'test_helper'

class WordTest < ActiveSupport::TestCase
  
  test "that the default specifics value is an empty hash" do
    assert Word.new.specifics.kind_of?(Hash)
  end

  test "has specifics setters and getters" do

    class WordInherent < Word
      define_specifics :test_method_1
      define_specifics :test_method_2, :test_method_3
    end

    assert WordInherent.new.respond_to?(:test_method_1)
    assert WordInherent.new.respond_to?(:test_method_2)
    assert WordInherent.new.respond_to?(:test_method_3)
  end

end