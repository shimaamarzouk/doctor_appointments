# frozen_string_literal: true

module AppointmentBooking
  module Domain
    module Repositories
      class AppointmentRepository
        def create(appointment_data)
          raise NotImplementedError
        end

        def find_by_slot(slot_id)
          raise NotImplementedError
        end

        def find_by_patient(patient_id)
          raise NotImplementedError
        end

        def update_status(appointment_id, status)
          raise NotImplementedError
        end
      end
    end
  end
end
