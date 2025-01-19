# frozen_string_literal: true

# This seeds file should create the database records required to run the app.
#
# The code should be idempotent so that it can be executed at any time.
#
# To load the seeds, run `hanami db seed`. Seeds are also loaded as part of `hanami db prepare`.

Hanami.app.prepare(:persistence)

# Create default doctors
default_doctors = [
  { name: "Dr. John Smith" },
]

doctor_repo = Hanami.app["repos.doctor_repository"]

default_doctors.each do |doctor|
  created_doctor = doctor_repo.create(doctor)
  puts "Created doctor: #{created_doctor[:name]} (#{created_doctor[:id]})"
end
