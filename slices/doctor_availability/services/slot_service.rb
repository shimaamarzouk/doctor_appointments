# frozen_string_literal: true

module DoctorAvailability
  module Services
    class SlotService
      include Deps["repositories.slot_repository"]

      def list_all_slots
        slot_repository.find_all
      end
    
      def create_slot(attributes)
        slot_repository.create(attributes)
      end
    end
  end
end
