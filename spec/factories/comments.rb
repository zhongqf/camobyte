# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
      target_id 1
      target_type "MyString"
      user_id 1
      body "MyText"
      body_html "MyText"
      status 1
      deleted false
    end
end