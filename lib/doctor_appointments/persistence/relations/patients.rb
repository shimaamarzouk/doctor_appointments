# frozen_string_literal: true

require_relative "../../types"

module DoctorAppointments
  module Persistence
    module Relations
      class Patients < ROM::Relation[:sql]
        schema(:patients) do
          attribute :id, DoctorAppointments::Types::UUID
          attribute :name, DoctorAppointments::Types::String

          primary_key :id
        end
      end
    end
  end
end
