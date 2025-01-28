# frozen_string_literal: true

require 'securerandom'

module AppointmentBooking
  module Infrastructure
    module Repositories
      class 
        RomSlotRepository < Domain::Repositories::SlotRepository
        def initialize(rom: Hanami.app['persistence.rom'])
          @rom = rom
        end

        def find_available
          slots.where(is_reserved: false).to_a
        end

        private

        def slots
          @rom.relations[:slots]
        end
      end
    end
  end
end
