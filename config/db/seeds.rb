# This seeds file should create the database records required to run the app.
#
# The code should be idempotent so that it can be executed at any time.
#
# To load the seeds, run `hanami db seed`. Seeds are also loaded as part of `hanami db prepare`.

# For example, if you have appropriate repos available:
#
#   category_repo = Hanami.app["repos.category_repo"]
#   category_repo.create(title: "General")
#
# Alternatively, you can use relations directly:
#
#   categories = Hanami.app["relations.categories"]
#   categories.insert(title: "General")

Hanami.app.prepare(:persistence)

# Clear existing records
doctors = Hanami.app["persistence.rom"].relations[:doctors]
doctors.delete

# Create default doctors
default_doctors = [
  { name: "Dr. John Smith" },
]

doctors.command(:create).call(default_doctors)

puts "Created #{default_doctors.length} default doctors:"
default_doctors.each do |doctor|
  puts "- #{doctor[:name]} (#{doctor[:id]})"
end
