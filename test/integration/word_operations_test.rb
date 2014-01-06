require 'test_helper'

class WordOperationsTest < ActionDispatch::IntegrationTest

  fixtures :users, :words

  def setup
    login!(users(:user_with_word).email)
    visit(my_words_path)
  end

  test 'list available words' do
    assert_page_with_title('Words')
    assert page.has_content?(words(:user_word).foreign_form)
  end

  test 'create word from each type' do
    Word.inheritors.each do |word_type|
      click_link(word_type)
      assert_page_with_title('Words')

      click_link("New #{word_type}")
      assert_page_with_title('New word')

      fill_in('word_foreign_form', with: "#{word_type}_foreign_form")
      fill_in('word_known_form',   with: "#{word_type}_known_form")
      click_button('Save')

      assert_page_with_title('Words')
      assert_notice_message('Word successfully created.')
    end
  end

  test 'cancel word creation' do
  end

  test 'edit word' do
    click_link('Edit')
    assert_page_with_title('Edit word')
    fill_in('word_foreign_form', with: 'edited_foreign_form')
    fill_in('word_known_form', with: 'edited_known_form')
    click_button('Save')

    assert_page_with_title('Words')
    assert_notice_message('The word was successfully updated.')
  end

  test 'delete word' do
    assert_page_with_title('Words')
    assert page.has_content?(words(:user_word).foreign_form)
    click_button('Delete')

    assert_page_with_title('Words')
    assert_notice_message('The word was deleted successfully.')
    assert_not page.has_content?(words(:user_word).foreign_form)
  end

end