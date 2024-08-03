class CreateBands < ActiveRecord::Migration[7.2]
  def change
    create_table :bands do |t|
      t.string :key
      t.string :name
      t.string :range
      t.decimal :frequency_start_mhz, precision: 8, scale: 4
      t.decimal :frequency_end_mhz, precision: 8, scale: 4
      t.boolean :is_active, default: :true
      t.integer :order

      t.timestamps
    end
  end
end