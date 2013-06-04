class RenameUntilToTil < ActiveRecord::Migration
  def change
    rename_column :schedules, :until, :til
    rename_column :slots, :until, :til
  end
end
