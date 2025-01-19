# frozen_string_literal: true

module DoctorAvailability
  module Actions
    module Slots
      class List < Hanami::Action
        include Deps["services.slot_service"]

        def handle(request, response)
          slots = slot_service.list_all_slots

          response.format = :json
          response.body = {
            status: 'success',
            data: slots.map do |slot|
              {
                id: slot.id,
                time: slot.time,
                doctor_id: slot.doctor_id,
                doctor_name: slot.doctor_name,
                is_reserved: slot.is_reserved,
                cost: slot.cost
              }
            end
          }.to_json
        end
      end
    end
  end
end
