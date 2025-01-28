# frozen_string_literal: true

require 'doctor_appointments/types'

module AppointmentBooking
  module Infrastructure
    module Persistence
      module Relations
        class Appointments < ROM::Relation[:sql]
          schema(:appointments) do
            attribute :id, DoctorAppointments::Types::UUID
            attribute :slot_id, DoctorAppointments::Types::UUID
            attribute :patient_id, DoctorAppointments::Types::UUID
            attribute :patient_name, DoctorAppointments::Types::String
            attribute :reserved_at, DoctorAppointments::Types::Time
            attribute :status, DoctorAppointments::Types::String

            primary_key :id
          end

          def by_slot(slot_id)
            where(slot_id: slot_id)
          end

          def by_patient(patient_id)
            where(patient_id: patient_id)
          end
        end
      end
    end
  end
end
