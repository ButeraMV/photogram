FactoryBot.define do
  factory :user do
    username { 'coolusername' }
    email { 'test@test.com' }
    password { 'password' }
    id { 1 }
  end
end
