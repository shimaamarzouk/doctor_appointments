# frozen_string_literal: true

Hanami.app.register_provider :repos do
  prepare do
    require_relative "../../app/repos/doctor_repository"
  end

  start do
    register "repos.doctor_repository", Repos::DoctorRepository.new
  end
end
