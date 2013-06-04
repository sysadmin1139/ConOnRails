class AddPermsToRole < ActiveRecord::Migration
  def change
    add_column :roles, :assign_slots, :boolean
  end
end
