# frozen_string_literal: true

module AppointmentBooking
  module Domain
    module Entities
      class Appointment
        attr_reader :id, :slot_id, :patient_id, :patient_name, :reserved_at, :status

        def initialize(id:, slot_id:, patient_id:, patient_name:, reserved_at:, status:)
          @id = id
          @slot_id = slot_id
          @patient_id = patient_id
          @patient_name = patient_name
          @reserved_at = reserved_at
          @status = status
        end

        def confirmed?
          status == 'confirmed'
        end

        def completed?
          status == 'completed'
        end

        def canceled?
          status == 'canceled'
        end
      end
    end
  end
end
