class WelcomeController < ApplicationController
  before_action :authenticate_user!


  def index
  @last = Contact.order(:qso_date).last
  @monthly = Contact.this_year.group_by_month(:qso_date, format: "%b %Y").count
  @annual = Contact.group_by_year(:qso_date, format: "%Y").count
  # @bands = Contact.select(:band).distinct
  @gridsquares = Contact.select(:gridsquare).distinct.count
  @gridsquares_this_year = Contact.select(:gridsquare).this_year.distinct.count
  @prefixes = Contact.select(:prefix).distinct.count
  @prefixes_this_year = Contact.select(:prefix).this_year.distinct.count
  @slot_total = Contact.select(:country, :band).where("country is not null").distinct.count
  @slot_total_this_year = Contact.this_year.select(:country, :band).where("country is not null").distinct.count
  
  sql_source = "'select max(cty.dxcc_id), country, band, count(band) from contacts c join countries cty on cty.dxcc_id = c.dxcc_id group by country, band order by 2,3 desc'"
  sql_cat = "'select distinct band from contacts dxcc order by 1'"
  # sql = "select * from crosstab(" + sql_source + ", " + sql_cat + ') AS ct(country text, "10m" int, "12m" int, "15m" int, "20m" int, "40m" int, "6m" int);'
  #add 17m
  sql = "select * from crosstab(" + sql_source + ", " + sql_cat + ') AS ct(id int, country text, "10m" int, "12m" int, "15m" int, "17m" int, "20m" int, "40m" int, "6m" int);'
  @slots = ActiveRecord::Base.connection.execute(sql)



  sql = <<SQL
      SELECT yrm
      , SUM(SUM(flag))
      OVER (ORDER BY yrm
      ROWS UNBOUNDED PRECEDING) AS cumulative_new_countries
      FROM
      (
      SELECT
      country
      , to_char(qso_date, 'YYYY-MM') AS yrm
      , CASE -- find the first year when a customer placed an order
      WHEN to_char(qso_date, 'YYYY-MM')
      = MIN(to_char(qso_date, 'YYYY-MM'))
      OVER (PARTITION BY country)
      THEN 1
      ELSE 0
      END AS flag
      FROM contacts
      WHERE country IS NOT NULL
      GROUP BY yrm, country
      ) AS dt
      GROUP BY 1
SQL
@culmulative_dxcc = Contact.find_by_sql [sql]

@yrm = @culmulative_dxcc.map(&:yrm).to_json

  end

end