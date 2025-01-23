# frozen_string_literal: true

module DoctorAppointments
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    slice :doctor_availability, at: "/" do
      get "/slots", to: "slots.list"
      post "/slots", to: "slots.create"
    end

    slice :appointment_booking, at: "/" do
      get "/slots/available", to: "slots.available"
      post "/appointments", to: "appointments.book"
    end
  end
end
