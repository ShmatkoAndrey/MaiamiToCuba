class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.datetime :date
      t.integer :ferry_id
      t.string :place
      t.integer :timetable_id

      t.timestamps null: false
    end
  end
end
