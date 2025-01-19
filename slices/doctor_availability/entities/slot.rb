module DoctorAvailability
  module Entities
    class Slot
      attr_reader :id, :time, :doctor_id, :doctor_name, :is_reserved, :cost

      def initialize(id:, time:, doctor_id:, doctor_name:, is_reserved: false, cost:)
        @id = id
        @time = time
        @doctor_id = doctor_id
        @doctor_name = doctor_name
        @is_reserved = is_reserved
        @cost = cost
      end
    end
  end
end
