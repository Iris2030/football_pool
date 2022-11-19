FactoryBot.define do
  factory :user do
    id {Faker::IDNumber.croatian_id}
    email {Faker::Internet.email}
    first_name  {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    password {111111}
  end
end
