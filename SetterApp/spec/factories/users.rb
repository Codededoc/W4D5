FactoryBot.define do
  factory :user do
    username { Faker::HarryPotter.character }
    password { 'hogwarts' }
  end
end
