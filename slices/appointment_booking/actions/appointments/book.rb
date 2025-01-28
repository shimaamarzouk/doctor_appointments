# frozen_string_literal: true

module AppointmentBooking
  module Actions
    module Appointments
      class Book < Hanami::Action
        include Deps[
          book_appointment: "appointment_booking.use_cases.book_appointment"
        ]

        def handle(request, response)
          appointment = book_appointment.call(
            slot_id: request.params[:slot_id],
            patient_id: request.params[:patient_id],
            patient_name: request.params[:patient_name]
          )

          response.format = :json
          response.body = {
            status: 'success',
            data: {
              id: appointment[:id],
              slot_id: appointment[:slot_id],
              patient_id: appointment[:patient_id],
              patient_name: appointment[:patient_name],
              reserved_at: appointment[:reserved_at],
              status: appointment[:status]
            }
          }.to_json
        rescue AppointmentBooking::Application::UseCases::SlotNotAvailableError => e
          response.status = 422
          response.format = :json
          response.body = { status: 'error', message: e.message }.to_json
        end
      end
    end
  end
end
