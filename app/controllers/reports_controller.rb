class ReportsController < ApplicationController

  def us_states
  sql_source = "'select state, band, count(band) from contacts c where c.state IS NOT NULL group by band, state order by 1,2 desc'"
  sql_cat = "'select distinct band from contacts where state IS NOT NULL order by 1 desc'"
  sql = "select * from crosstab(" + sql_source + ", " + sql_cat + ') AS ct(state text, "40m" int, "20m" int, "17m" int, "15m" int, "12m" int, "10m" int);'
  @us_states = ActiveRecord::Base.connection.execute(sql)
  puts @us_states
  end
end
