FactoryBot.define do
  factory :location do
    place { Faker::GameOfThrones.city }
  end
end
