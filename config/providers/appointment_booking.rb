# frozen_string_literal: true

Hanami.app.register_provider :appointment_booking do
  prepare do
    require_relative "../../slices/appointment_booking/domain/repositories/appointment_repository"
    require_relative "../../slices/appointment_booking/infrastructure/repositories/rom_appointment_repository"
    require_relative "../../slices/appointment_booking/application/use_cases/book_appointment"
    require_relative "../../slices/appointment_booking/application/use_cases/list_available_slots"
  end

  start do
    appointment_repository = AppointmentBooking::Infrastructure::Repositories::RomAppointmentRepository.new
    slot_repository = Hanami.app["repositories.slot_repository"]

    register "repositories.appointment_repository", appointment_repository
    register "use_cases.book_appointment", 
      AppointmentBooking::Application::UseCases::BookAppointment.new(
        appointment_repository: appointment_repository,
        slot_repository: slot_repository
      )
    register "use_cases.list_available_slots",
      AppointmentBooking::Application::UseCases::ListAvailableSlots.new(
        slot_repository: slot_repository
      )
  end
end
