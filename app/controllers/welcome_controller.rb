class WelcomeController < ApplicationController
  def index
  @last = Contact.last
  @monthly = Contact.this_year.group_by_month(:qso_date, format: "%b %Y").count
  @annual = Contact.group_by_year(:qso_date, format: "%Y").count
  end
end
