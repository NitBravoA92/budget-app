FactoryBot.define do
  factory :payment do
    name { 'MyString' }
    amount { '9.99' }
    author { nil }
  end
end
