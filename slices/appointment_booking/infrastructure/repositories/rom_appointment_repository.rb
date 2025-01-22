# frozen_string_literal: true

module AppointmentBooking
  module Infrastructure
    module Repositories
      class RomAppointmentRepository < Domain::Repositories::AppointmentRepository
        def initialize(rom: Hanami.app['persistence.rom'])
          @rom = rom
        end

        def create(appointment_data)
          appointments.command(:create).call(appointment_data)
        end

        def find_by_slot(slot_id)
          appointments.by_slot(slot_id).to_a
        end

        def find_by_patient(patient_id)
          appointments.by_patient(patient_id).to_a
        end

        def update_status(appointment_id, status)
          appointments.by_pk(appointment_id).command(:update).call(status: status)
        end

        private

        def appointments
          @rom.relations[:appointments]
        end
      end
    end
  end
end
