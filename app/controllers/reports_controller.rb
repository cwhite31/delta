class ReportsController < ApplicationController


  def gridsquares
    sql_source = "'select max(cty.id), country, band, count(DISTINCT gridsquare) from contacts c join countries cty on cty.dxcc_id = c.dxcc_id group by country, band order by 2,3 desc'"
    sql_cat = "'select distinct band from contacts dxcc order by 1'"
    sql = "select * from crosstab(" + sql_source + ", " + sql_cat + ') AS ct(id int, country text, "10m" int, "12m" int, "15m" int, "17m" int, "20m" int, "40m" int, "6m" int);'
    @grids = ActiveRecord::Base.connection.execute(sql)
  end

  def prefixes
    sql_source = "'select max(cty.id), country, band, count(DISTINCT c.prefix) from contacts c join countries cty on cty.dxcc_id = c.dxcc_id group by country, band order by 2,3 desc'"
    sql_cat = "'select distinct band from contacts dxcc order by 1'"
    sql = "select * from crosstab(" + sql_source + ", " + sql_cat + ') AS ct(id int, country text, "10m" int, "12m" int, "15m" int, "17m" int, "20m" int, "40m" int, "6m" int);'
    @prefixes = ActiveRecord::Base.connection.execute(sql)
  end

  def signal_report_received
    sql_source = "'select max(cty.id), country, band, CAST(AVG(signal_report_received) AS int) from contacts c join countries cty on cty.dxcc_id = c.dxcc_id group by country, band order by 2,3 desc'"
    sql_cat = "'select distinct band from contacts dxcc order by 1'"
    sql = "select * from crosstab(" + sql_source + ", " + sql_cat + ') AS ct(id int, country text, "10m" int, "12m" int, "15m" int, "17m" int, "20m" int, "40m" int, "6m" int);'
    @prefixes = ActiveRecord::Base.connection.execute(sql)
  end

  def us_states
    sql_source = "'select state, band, count(band) from contacts c where c.state IS NOT NULL group by band, state order by 1,2 desc'"
    sql_cat = "'select distinct band from contacts where state IS NOT NULL order by 1 desc'"
    sql = "select * from crosstab(" + sql_source + ", " + sql_cat + ') AS ct(state text, "40m" int, "20m" int, "17m" int, "15m" int, "12m" int, "10m" int);'
    @us_states = ActiveRecord::Base.connection.execute(sql)
    
    @current = Contact.distinct.pluck(:state)
    @state_array =%w(AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY)
    @current.each do |st|
      unless st == nil
        if @state_array.include? st
         @state_array.delete(st)
        end
      end
    end
  end
end
