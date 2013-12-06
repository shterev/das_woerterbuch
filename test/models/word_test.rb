require 'test_helper'

class WordTest < ActiveSupport::TestCase
  
  test "that the default specifics value is an empty hash" do
    assert Word.new.specifics.kind_of?(Hash)
  end

end