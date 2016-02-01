class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :ferry_id
      t.string :name
      t.integer :price

      t.timestamps null: false
    end
  end
end
