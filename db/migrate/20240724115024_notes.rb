class Notes < ActiveRecord::Migration[7.2]
  def change
    create_table :notes do |t|
      t.string :category
      t.string :title, null: false
      t.text :note

      t.timestamps
    end
  end
end
