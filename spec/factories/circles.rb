# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :circle do
      company_id 1
      owner_id 1
      name "MyString"
      permalink "MyString"
      last_comment_id 1
      comments_count 1
      watchers_ids "MyString"
      conversations_count 1
      last_conversation_id 1
      public false
      deleted false
    end
end