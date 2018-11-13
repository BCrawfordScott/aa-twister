FactoryBot.define do
  factory :twist do
    body { "left foot red" }
    author { create :user }
  end

end
