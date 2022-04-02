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
event_names = %w[Equinox Soltice Spring Summer Winter Autumn Sun Snow Rain River Farm Flower Fruit Music Cow Duck Heritage Water Stone Fire]
event_types = %w[Festival Anniversary Competion Fair Feast Gala Holiday Carnival Fiesta Jubilee Celebration Exhibition Market Bash]
event_descriptions = [
  "Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view.",
  "Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution.",
  "Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop.",
  "Podcasting operational change management inside of workflows to establish a framework. Taking seamless key performance indicators offline to maximise the long tail. Keeping your eye on the ball while performing a deep dive on the start-up mentality.",
  "Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without revolutionary ROI."
]

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
  Event.create(title: "#{event_names.sample} #{event_types.sample}",
               location: "#{locations.sample}",
               date: "#{dates.sample}",
               description: "#{event_descriptions.sample}",
               creator_id: "#{User.all.to_a.sample.id}")
  end

(1..30).each do |i|
  Invitation.create(event_id: "#{Event.all.to_a.sample.id}",
                    attendee_id: "#{User.all.to_a.sample.id}")
  end
