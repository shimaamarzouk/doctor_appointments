# frozen_string_literal: true

require 'securerandom'

module Repos
  class DoctorRepository
    def initialize(rom: Hanami.app['persistence.rom'])
      @rom = rom
    end

    def create(attributes)
      doctors.command(:create).call(
        id: SecureRandom.uuid,
        name: attributes[:name]
      )
    end

    def find_all
      doctors.to_a
    end
    
    def find_first
      doctors.first
    end

    def find(id)
      doctors.by_pk(id).one
    end

    private

    def doctors
      @rom.relations[:doctors]
    end
  end
end
