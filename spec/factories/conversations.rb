# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :conversation do
      user_group_id 1
      user_group_type "MyString"
      user_id 1
      title "MyString"
      last_comment_id 1
      comments_count 1
      watchers_ids "MyString"
      simple false
      deleted false
    end
end