class AddStatusToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :status, :string, default: "pending"
    add_column :events, :token, :string
  end
end
