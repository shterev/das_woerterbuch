require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test '#website_availability_period_in_years returns only one year' do
    assert website_availability_period_in_years(Time.now.year) == Time.now.year
  end

  test '#website_availability_period_in_years returns year period' do
    assert website_availability_period_in_years(2000) == "2000-#{Time.now.year}"
  end

end