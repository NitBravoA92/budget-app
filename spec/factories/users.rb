FactoryBot.define do
  factory :user do
    id { rand(1..400_000) }
    name { 'James Williams' }
    email { "james_#{id}@mail.com" }
    password { 'james12345' }
    confirmed_at { Time.now }
  end
end
