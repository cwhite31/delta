class CreateCountries < ActiveRecord::Migration[7.2]
  def change
    create_table :countries do |t|
      t.string :prefix
      t.string :name
      t.integer :dxcc_id
      t.string :continent_code
      t.integer :cq_zone
      t.integer :itu_zone
      t.decimal :lat, precision: 6, scale: 2
      t.decimal :long, precision: 6, scale: 2
      t.decimal :utc_offset, precision: 6, scale: 2
      t.text :alias
    end
    add_index :countries, :name
    add_index :countries, :prefix
    add_index :countries, :dxcc_id
  end
end
