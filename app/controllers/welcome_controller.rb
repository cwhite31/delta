class WelcomeController < ApplicationController
  before_action :authenticate_user!


  def index
  @last = Contact.last
  @monthly = Contact.this_year.group_by_month(:qso_date, format: "%b %Y").count
  @annual = Contact.group_by_year(:qso_date, format: "%Y").count
  @bands = Contact.select(:band).distinct


  sql_source = "'select country, band, count(band) from contacts c where band != '17m' group by country, band order by 1,2 desc'"
  sql_cat = "'select distinct band from contacts dxcc order by 1'"
  # sql = "select * from crosstab(" + sql_source + ", " + sql_cat + ') AS ct(country text, "10m" int, "12m" int, "15m" int, "20m" int, "40m" int, "6m" int);'
  #add 17m
  sql = "select * from crosstab(" + sql_source + ", " + sql_cat + ') AS ct(country text, "10m" int, "12m" int, "15m" int, "17m" int, "20m" int, "40m" int, "6m" int);'
  @slots = ActiveRecord::Base.connection.execute(sql)
  end
end
