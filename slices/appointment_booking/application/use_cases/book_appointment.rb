# frozen_string_literal: true

require 'securerandom'

module AppointmentBooking
  module Application
    module UseCases
      class BookAppointment
        def initialize(appointment_repository:, slot_repository:, patient_repository:)
          @appointment_repository = appointment_repository
          @slot_repository = slot_repository
          @patient_repository = patient_repository
        end

        def call(slot_id:, patient_id:, patient_name:)
          # Verify slot is available
          slot = @slot_repository.find(slot_id)
          raise SlotNotAvailableError unless slot && !slot[:is_reserved]

          ## get patient info from params or create a new patient
          if patient_id.present?
            patient = @patient_repository.find(patient_id)
          else
            patient = @patient_repository.create(name: patient_name)
          end

          # Create appointment
          appointment_data = {
            id: SecureRandom.uuid,
            slot_id: slot_id,
            patient_id: patient.id,
            patient_name: patient.name,
            reserved_at: Time.now,
            status: 'confirmed'
          }

          # Book the slot and create appointment atomically
          appointment = nil
          Hanami.app["persistence.rom"].transaction do
            @slot_repository.mark_as_reserved(slot_id)
            appointment = @appointment_repository.create(appointment_data)
          end

          appointment
        end
      end

      class SlotNotAvailableError < StandardError
        def message
          "The selected slot is not available"
        end
      end
    end
  end
end
