# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'ryan'
    email 'goodboyryan'
    password '123123'
    password_confirmation '123123'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
  end
end
