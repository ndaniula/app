class CreateEmergencyContactEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :emergency_contact_events do |t|
      t.references :emergency_contact, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
