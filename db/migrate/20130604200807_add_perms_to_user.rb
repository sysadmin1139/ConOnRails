class AddPermsToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin_schedule, :boolean
    add_column :users, :assign_slots, :boolean
  end
end
