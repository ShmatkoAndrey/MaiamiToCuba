class CreateFerries < ActiveRecord::Migration
  def change
    create_table :ferries do |t|
      t.string :name
      t.string :typeship

      t.timestamps null: false
    end
  end
end
