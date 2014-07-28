# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attendance do
    user nil
    event nil
    location nil
  end
end
