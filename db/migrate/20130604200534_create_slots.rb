class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.datetime :from
      t.datetime :until
      t.integer :position_id
      t.integer :volunteer_id

      t.timestamps
    end
  end
end
