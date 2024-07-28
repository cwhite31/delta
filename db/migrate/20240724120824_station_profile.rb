class StationProfile < ActiveRecord::Migration[7.2]
  def change
    create_table :station_profiles do |t|
      t.string :station_callsign, null: false
      t.string :station_profile_name, null: false
      t.string :station_gridsquare
      t.string :station_city, null: false
      t.string :station_iota
      t.string :station_sota
      t.string :station_dxcc
      t.string :station_country
      t.string :station_cnty
      t.integer :station_cq
      t.integer :station_itu

      t.timestamps
    end
  end
end
