# frozen_string_literal: true

ROM::SQL.migration do
  # Add your migration here.
  #
  # See https://guides.hanamirb.org/v2.2/database/migrations/ for details.
  change do
    create_table :slots do
      column :id, :uuid, null: false
      primary_key [:id]
      column :time, :time, null: false
      column :doctor_id, :varchar, null: false
      column :doctor_name, :varchar
      column :is_reserved, :boolean, default: false
      column :cost, :integer
    end
  end
end
