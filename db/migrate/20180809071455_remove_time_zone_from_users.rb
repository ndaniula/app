class RemoveTimeZoneFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :time_zone, :string
  end
end
