# frozen_string_literal: true

module DoctorAvailability
  module Services
    class SlotService
      include Deps["repositories.slot_repository"]

      def list_all_slots
        slot_repository.find_all
      end

      def list_available_slots
        slot_repository.find_available
      end
    
      def create_slot(attributes)
        doctor_repository = Hanami.app["repos.doctor_repository"]
        first_doctor = doctor_repository.find_first
        attributes.merge!({doctor_id: first_doctor[:id], doctor_name: first_doctor[:name]})
        slot_repository.create(attributes)
      end

      def reserve_slot(id)
        slot_repository.mark_as_reserved(id)
      end
    end
  end
end
