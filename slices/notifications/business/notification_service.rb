# frozen_string_literal: true

module Notifications
  module Business
    class NotificationService
      def initialize(notification_repository:)
        @notification_repository = notification_repository
      end

      def send_appointment_confirmation(appointment_details)
        message = format_appointment_confirmation(appointment_details)
        @notification_repository.send_notification(message)
      end

      private

      def format_appointment_confirmation(details)
        <<~MESSAGE
          ===== Appointment Confirmation =====
          Patient Name: #{details.fetch(:patient_name)}
          Doctor Name: #{details.fetch(:doctor_name)}
          Appointment Time: #{details.fetch(:appointment_time)}
          ===================================
        MESSAGE
      end
    end
  end
end
