# frozen_string_literal: true

require 'securerandom'

module AppointmentBooking
  module Application
    module UseCases
      class BookAppointment
        include Deps[
          notification_controller: "notifications.notification_controller"
        ]

        def initialize(appointment_repository:, slot_repository:, notification_controller:)
          @appointment_repository = appointment_repository
          @slot_repository = slot_repository
          @notification_controller = notification_controller
        end

        def call(slot_id:, patient_id:, patient_name:)
          # Verify slot is available
          slot = @slot_repository.find(slot_id)
          raise SlotNotAvailableError unless slot && !slot[:is_reserved]

          # Create appointment
          appointment_data = {
            id: SecureRandom.uuid,
            slot_id: slot_id,
            patient_id: patient_id,
            patient_name: patient_name,
            reserved_at: Time.now,
            status: 'confirmed'
          }

          # Book the slot and create appointment atomically
          appointment = nil
          Hanami.app["persistence.rom"].transaction do
            @slot_repository.mark_as_reserved(slot_id)
            appointment = @appointment_repository.create(appointment_data)
          end

          # Send confirmation notification
          @notification_controller.notify_appointment_confirmation(
            patient_name: patient_name,
            doctor_name: slot[:doctor_name],
            appointment_time: slot[:time]
          )

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
