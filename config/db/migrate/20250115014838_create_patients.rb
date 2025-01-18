# frozen_string_literal: true

ROM::SQL.migration do
  # Add your migration here.
  #
  # See https://guides.hanamirb.org/v2.2/database/migrations/ for details.
  change do
    create_table :patients do
      column :id, :uuid, null: false
      primary_key [:id]
      column :name, :varchar, null: false
    end
  end
end
