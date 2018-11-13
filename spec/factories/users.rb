FactoryBot.define do
  factory :user do
    username { Faker::StarWars.character }
    password { "starwars" }
    location { create :location }
  end
end
