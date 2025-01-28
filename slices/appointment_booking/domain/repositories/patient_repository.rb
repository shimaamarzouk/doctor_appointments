module AppointmentBooking
  module Domain
    module Repositories
      class PatientRepository# < ROM::Repository[:patients]
        # commands :create

        def find_by_id(id)
          raise NotImplementedError
          # patients.by_pk(id).one
        end

        def create_with_id(data)
          raise NotImplementedError
          # create(data.merge(id: SecureRandom.uuid))
        end
      end
    end
  end
end
