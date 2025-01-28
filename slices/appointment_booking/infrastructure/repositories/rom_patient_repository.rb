# frozen_string_literal: true

require 'securerandom'

module AppointmentBooking
  module Infrastructure
    module Repositories
      class RomPatientRepository < Domain::Repositories::PatientRepository
        def initialize(rom: Hanami.app['persistence.rom'])
          @rom = rom
        end

        def find_by_id(id)
          patients.by_pk(id).one
        end

        def create_with_id(data)
          create(data.merge(id: SecureRandom.uuid))
        end

        private

        def patients
          @rom.relations[:patients]
        end
      end
    end
  end
end
