class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
      t.integer :sequence
      t.integer :schedule_id

      t.timestamps
    end
  end
end
