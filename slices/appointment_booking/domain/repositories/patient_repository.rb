module AppointmentBooking
  module Domain
    module Repositories
      class PatientRepository
        # commands :create

        def find_by_id(id)
          raise NotImplementedError
        end

        def create_with_id(data)
          raise NotImplementedError
        end
      end
    end
  end
end
