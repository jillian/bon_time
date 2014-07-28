# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_invitation do
    user nil
    event nil
    accepted false
  end
end
