class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.integer :ferry_id
      t.datetime :date
      t.datetime :date_arrival
      t.string :direction

      t.timestamps null: false
    end
  end
end
