# frozen_string_literal: true

require 'securerandom'

module DoctorAvailability
  module Repositories
    class SlotRepository
      def initialize(rom: Hanami.app['persistence.rom'])
        @rom = rom
      end

      def create(attributes)
        slots.command(:create).call(
          id: SecureRandom.uuid,
          time: attributes[:time],
          doctor_id: attributes[:doctor_id],
          doctor_name: attributes[:doctor_name],
          is_reserved: false,
          cost: attributes[:cost]
        )
      end

      def find_all
        slots.to_a
      end

      def find_available
        slots.where(is_reserved: false).to_a
      end

      def find(id)
        slots.by_pk(id).one
      end

      def mark_as_reserved(id)
        slots.by_pk(id).command(:update).call(is_reserved: true)
      end

      private

      def slots
        @rom.relations[:slots]
      end
    end
  end
end
