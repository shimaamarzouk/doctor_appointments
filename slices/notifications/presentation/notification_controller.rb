# frozen_string_literal: true

module Notifications
  module Presentation
    class NotificationController
      def initialize(notification_service:)
        @notification_service = notification_service
      end

      def notify_appointment_confirmation(appointment_details)
        validate_appointment_details!(appointment_details)
        @notification_service.send_appointment_confirmation(appointment_details)
      end

      private

      def validate_appointment_details!(details)
        required_fields = [:patient_name, :doctor_name, :appointment_time]
        missing_fields = required_fields - details.keys

        unless missing_fields.empty?
          raise ArgumentError, "Missing required fields: #{missing_fields.join(', ')}"
        end
      end
    end
  end
end
