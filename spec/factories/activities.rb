# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
      user_id 1
      target_id 1
      target_type "MyString"
      user_group_id 1
      user_group_type "MyString"
      comment_target_id 1
      comment_target_type "MyString"
      action "MyString"
      deleted false
    end
end