# frozen_string_literal: true

module AppointmentBooking
  module Actions
    module Slots
      class Available < Hanami::Action
        include Deps[
          list_available_slots: "appointment_booking.use_cases.list_available_slots"
        ]

        def handle(request, response)
          slots = list_available_slots.call

          response.format = :json
          response.body = {
            status: 'success',
            data: slots.map { |slot|
              {
                id: slot[:id],
                time: slot[:time],
                doctor_id: slot[:doctor_id],
                doctor_name: slot[:doctor_name],
                cost: slot[:cost]
              }
            }
          }.to_json
        end
      end
    end
  end
end
