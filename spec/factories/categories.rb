FactoryBot.define do
  factory :category do
    user
    name { 'Category 1' }
    icon { 'https://www.imageicon.com/test' }
  end
end
