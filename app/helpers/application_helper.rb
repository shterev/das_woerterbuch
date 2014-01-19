module ApplicationHelper

  def website_availability_period_in_years(start_year)
    current_year = Time.now.year
    (start_year == current_year) ? start_year : "#{start_year}-#{current_year}"
  end

end
