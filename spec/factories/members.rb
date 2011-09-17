# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
      user_group_id 1
      user_group_type "MyString"
      user_id 1
      role 1
    end
end