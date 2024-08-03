require 'csv'
ap 'Adding countries'
Country.destroy_all
csv_text = File.read(Rails.root.join('db', 'seeds', 'cty.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Country.new
  t.id = row['id']
  t.prefix = row['prefix']
  t.name = row['name']
  t.dxcc_id = row['dxcc_id']
  t.continent_code = row['cont']
  t.cq_zone = row['cq_zone']
  t.itu_zone = row['itu_zone']
  t.lat = row['lat']
  t.long = row['long']
  t.utc_offset = row['utc_offset']
  t.alias = row['alias'].chomp(';')
  t.save
  puts "."
end
