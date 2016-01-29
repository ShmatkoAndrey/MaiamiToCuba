class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.date :dete
      t.integer :ferry_id
      t.string :plase
      t.string :name

      t.timestamps null: false
    end
  end
end
