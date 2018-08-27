class CreateEventLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :event_logs do |t|
      t.datetime :date_time
      t.text :description
      t.string :attachment
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
