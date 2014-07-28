# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    address "MyString"
    city "MyString"
    zipcode "MyString"
    latitude 1.5
    longitude 1.5
    date "2014-07-03"
    time "2014-07-03 15:44:00"
    user nil
  end
end
