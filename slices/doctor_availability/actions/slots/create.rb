# frozen_string_literal: true

module DoctorAvailability
  module Actions
    module Slots
      class Create < Hanami::Action
        include Deps["services.slot_service"]

        def handle(request, response)
          slot = slot_service.create_slot(
            time: Time.parse(request.params[:time]),
            cost: BigDecimal(request.params[:cost])
          )

          response.format = :json
          response.body = {
            status: 'success',
            data: {
              id: slot[:id],
              time: slot[:time],
              doctor_id: slot[:doctor_id],
              doctor_name: slot[:doctor_name],
              is_reserved: slot[:is_reserved],
              cost: slot[:cost]
            }
          }.to_json
        end
      end
    end
  end
end
