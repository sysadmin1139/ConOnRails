class RemovePermsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :admin_schedule
    remove_column :users, :assign_slots
  end
end
