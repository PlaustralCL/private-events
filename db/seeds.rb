# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def locations
  %w[Monclair Redding Tiverton Clearfield Eastham Wyandotte Cushing Ridgewood Plainsfield]
end

def event_names
  %w[Equinox Soltice Spring Summer Winter Autumn Sun Snow Rain River Farm Flower Fruit Music Cow Duck Heritage Water Stone Fire]
end

def event_types
  %w[Festival Anniversary Competion Fair Feast Gala Holiday Carnival Fiesta Jubilee Celebration Exhibition Market Bash]
end

def event_descriptions
  [
    "Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view.",
    "Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution.",
    "Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop.",
    "Podcasting operational change management inside of workflows to establish a framework. Taking seamless key performance indicators offline to maximise the long tail. Keeping your eye on the ball while performing a deep dive on the start-up mentality.",
    "Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without revolutionary ROI."
  ]
end

def create_users
names = %w[Emma Olivia Ava Isabella Sophia Liam Noah James Logan]
users = names.each do |name|
  User.create(name: "#{name}",
              email: "#{name}@email.com",
              password: "123456",
              password_confirmation: "123456")
  end
end

def create_events(number_of_events: 10, time_period: "future")
  number_of_events.times do |i|
    event = Event.create(title: "#{event_names.sample} #{event_types.sample}",
                          location: "#{locations.sample}",
                          description: "#{event_descriptions.sample}",
                          creator_id: "#{User.all.to_a.sample.id}")
    if time_period == "future"
      event.date = Date.today + rand(1500)
    else
      event.date = Date.today - rand(700)
    end
    event.save
    end
end

def create_invitations(number_of_invites: 35)
  event_ids = (1..Event.all.count).to_a
  attendee_ids = (1..User.all.count).to_a

  number_of_invites.times do
    event = Event.find(event_ids.sample)
    attendee = attendee_ids.sample
    while attendee == event.creator_id do
      attendee = attendee_ids.sample
    end
    Invitation.create(event_id: event.id,
                      attendee_id: attendee)
  end
end

create_users
create_events
create_events(number_of_events: 5, time_period: "past")
create_invitations
