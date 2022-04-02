# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

locations = %w[Monclair Redding Tiverton Clearfield Eastham Wyandotte Cushing Ridgewood Plainsfield]
names = %w[Emma Olivia Ava Isabella Sophia Liam Noah James Logan]
years = (2021..2031).to_a.map(&:to_s)
months = (1..12).to_a.map(&:to_s).map { |month| month.rjust(2, "0") }
days = (1..28).to_a.map(&:to_s).map { |day| day.rjust(2, "0") }
event_descriptions = %w[Equinox Soltice Spring Summer Winter Autumn Sun Snow Rain River Farm Flower Fruit Music Cow Duck Heritage Water Stone Fire]
event_types = %w[Festival Anniversary Competion Fair Feast Gala Holiday Carnival Fiesta Jubilee Celebration Exhibition Market Bash]

users = names.each do |name|
  User.create(name: "#{name}",
              email: "#{name}@email.com",
              password: "123456",
              password_confirmation: "123456")
  end

dates = []
10.times do |i|
  dates << "#{years.sample}-#{months.sample}-#{days.sample}"
end

(1..10).each do |i|
  Event.create(title: "#{event_descriptions.sample} #{event_types.sample}",
               location: "#{locations.sample}",
                date: "#{dates.sample}",
                creator_id: "#{User.all.to_a.sample.id}")
  end

(1..30).each do |i|
  Invitation.create(event_id: "#{Event.all.to_a.sample.id}",
                    attendee_id: "#{User.all.to_a.sample.id}")
  end
