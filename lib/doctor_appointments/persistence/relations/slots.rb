# frozen_string_literal: true

require_relative '../../types'

module DoctorAppointments
  module Persistence
    module Relations
      class Slots < ROM::Relation[:sql]
        schema(:slots, infer: true) do
          attribute :id, DoctorAppointments::Types::UUID
          attribute :time, DoctorAppointments::Types::Time
          attribute :doctor_id, DoctorAppointments::Types::String
          attribute :doctor_name, DoctorAppointments::Types::String
          attribute :is_reserved, DoctorAppointments::Types::Bool
          attribute :cost, DoctorAppointments::Types::Integer

          primary_key :id
        end

        def available
          where(is_reserved: false)
        end
      end
    end
  end
end
