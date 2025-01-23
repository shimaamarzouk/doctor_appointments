# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :appointments do
      column :id, :uuid, primary_key: true
      column :slot_id, :uuid, null: false
      column :patient_id, :uuid, null: false
      column :patient_name, String, null: false
      column :reserved_at, DateTime, null: false
      column :status, String, null: false, default: 'confirmed'
      
      foreign_key [:slot_id], :slots
      foreign_key [:patient_id], :patients
    end
  end
end
