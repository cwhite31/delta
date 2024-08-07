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
      t.boolean :worked , default: false
      t.boolean :confirmed , default: false
      t.boolean :"2200m" , default: false
      t.boolean :"630m", default: false
      t.boolean :"160m", default: false
      t.boolean :"80m", default: false
      t.boolean :"60m", default: false
      t.boolean :"40m", default: false
      t.boolean :"30m", default: false
      t.boolean :"20m", default: false
      t.boolean :"17m", default: false
      t.boolean :"15m", default: false
      t.boolean :"12m", default: false
      t.boolean :"10m", default: false
      t.boolean :"8m", default: false
      t.boolean :"6m", default: false
      t.boolean :"4m", default: false
      t.boolean :"2m", default: false
      t.boolean :"70cm", default: false
      t.text :alias
    end
    add_index :countries, :name
    add_index :countries, :prefix
    add_index :countries, :dxcc_id
  end
end
