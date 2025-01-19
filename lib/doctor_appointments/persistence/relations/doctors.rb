# frozen_string_literal: true

require_relative "../../types"

module DoctorAppointments
  module Persistence
    module Relations
      class Doctors < ROM::Relation[:sql]
        schema(:doctors) do
          attribute :id, DoctorAppointments::Types::UUID
          attribute :name, DoctorAppointments::Types::String

          primary_key :id
        end
      end
    end
  end
end
