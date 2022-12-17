FactoryBot.define do
  factory :chat_message do
    content {Faker::Lorem.sentence}
    association :user
    association :chat_room

    after(:build) do |chat_message|
      chat_message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
