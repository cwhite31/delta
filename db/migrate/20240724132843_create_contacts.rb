class CreateContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      # station attributes
      t.string :callsign
      t.string :name
      t.string :prefix
      t.string :country
      t.string :state
      t.string :county
      t.integer :dxcc_id
      t.string :gridsquare
      t.string :iota_code
      t.integer :cq_zone
      t.integer :itu_zone
      t.integer :iaru_zone
      t.string :continent


      # contact attributes
      t.date :qso_date
      t.string :time_on
      t.string :time_off
      t.datetime :started_at
      t.datetime :ended_at
      t.string :band
      t.decimal :frequency, precision: 10, scale: 6
      t.decimal :frequency_split_transmit
      t.string :mode
      t.string :submode
      t.string :propagation_mode
      t.integer :signal_report_received
      t.integer :signal_report_sent
      t.integer :contest_id
      t.string :contest_reference_sent
      t.string :contest_reference_received
      t.string :satellite_name

      # meta
      t.string :operator_name
      t.string :qth
      t.string :power
      t.string :antenna
      t.string :category
      t.string :check
      t.string :licence_class
      t.string :comments
      t.string :computer
      t.string :station_gridsquare

      # QSL
      t.string :qsl_confirmed_by
      t.boolean :qsl_received
      t.boolean :qsl_sent
      t.boolean :lotw_qsl_sent
      t.boolean :lotw_qsl_received

      t.timestamps
    end
    add_index :contacts, :callsign
    add_index :contacts, :qso_date
  end
end
