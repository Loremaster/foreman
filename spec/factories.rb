include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :country do
    name 'New country'
  end

  factory :team do
    name 'Another team'
    country
    people_count 8
    price 1000
    tag_list 'painting'
  end
end