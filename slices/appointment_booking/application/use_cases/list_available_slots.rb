# frozen_string_literal: true

module AppointmentBooking
  module Application
    module UseCases
      class ListAvailableSlots
        def initialize(slot_repository:)
          @slot_repository = slot_repository
        end

        def call
          @slot_repository.find_available
        end
      end
    end
  end
end
