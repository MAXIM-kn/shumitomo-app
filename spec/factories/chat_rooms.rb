FactoryBot.define do
  factory :chat_room do
    name         { Faker::Name.name }
    introduction { Faker::Lorem.sentence }
    genre_id     { Faker::Number.between(from: 2, to: 8) }
    owner_id     { 1 }
  end
end
