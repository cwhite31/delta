require "awesome_print"
Contact.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("contacts")

records =  Array.new
field = Array.new
fields =  Array.new
File.foreach("db/seeds/sample.adi") do |line|
  unless line.match(/[^<]*<eor>[^<]*/i)
    field[0] = line[1..line.index(':').to_i]
    field[1] = line[(line.index('>')).to_i+1..-1].chomp
    fields << field
    field = Array.new
  else
    records << fields
    fields = Array.new
  end
  end
  # ap records
  records.each do |record|
    contact = Contact.new
contact.callsign = record.to_h["Call:"]
puts record.to_h["Call:"]
puts record.to_h["Freq:"]
puts '---------------------'
contact.qso_date = record.to_h["QSO_Date:"]
if record.to_h["Time_On:"]
  contact.time_on = record.to_h["Time_On:"]
  contact.started_at = record.to_h["QSO_Date:"] + " " + record.to_h["Time_On:"][0..1] + ":" + record.to_h["Time_On:"][2..3]+ ":" + record.to_h["Time_On:"][4..5]
else
  contact.started_at = record.to_h["QSO_Date:"]
end

if record.to_h["Time_Off:"]
  contact.time_off = record.to_h["Time_Off:"]
  contact.ended_at = record.to_h["QSO_Date:"] + " " + record.to_h["Time_Off:"][0..1] + ":" + record.to_h["Time_Off:"][2..3]+ ":" + record.to_h["Time_Off:"][4..5]
else
  contact.ended_at = record.to_h["QSO_Date:"]
end

contact.band = record.to_h["Band:"]
contact.continent = record.to_h["Cont:"]
contact.county = record.to_h["Cnty:"]
contact.state = record.to_h["State:"]
contact.country = record.to_h["Country:"]
contact.dxcc_id = record.to_h["DXCC:"]
contact.cq_zone = record.to_h["CQz:"]
contact.itu_zone = record.to_h["ITUz:"]
contact.frequency = record.to_h["Freq:"]
contact.gridsquare = record.to_h["Gridsquare:"]
contact.station_gridsquare = record.to_h["My_Gridsquare:"]
contact.mode = record.to_h["Mode:"]
contact.operator_name = record.to_h["Operator:"]
contact.prefix = record.to_h["Prefix:"]
contact.signal_report_received = record.to_h["RST_Rcvd:"]
contact.signal_report_sent = record.to_h["RST_Sent:"]
contact.qsl_received = record.to_h["QSL_Rcvd:"]
contact.lotw_qsl_received = record.to_h["QSL_Rcvd:"]
contact.qsl_sent = record.to_h["QSL_Sent:"]
contact.lotw_qsl_sent = record.to_h["QSL_Sent:"]
contact.qsl_confirmed_by = record.to_h["N3FJP_QSLSCB:"]
contact.comments = record.to_h["Comment:"]
contact.power = record.to_h["TX_PWR:"]

contact.save!
  end
