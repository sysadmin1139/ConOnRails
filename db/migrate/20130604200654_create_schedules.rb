class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.datetime :from
      t.datetime :until

      t.timestamps
    end
  end
end
