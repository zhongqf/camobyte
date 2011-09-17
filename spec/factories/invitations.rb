# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invitation do
      user_id 1
      target_id 1
      target_type "MyString"
      role 1
      email "MyString"
      invited_user_id 1
      token "MyString"
      deleted false
    end
end