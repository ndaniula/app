class AddIndexToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_number, :string
    add_index :events, :event_number
  end
end
