# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workspace do
      organization_id 1
      owner_id 1
      name "MyString"
      permalink "MyString"
      last_comment_id 1
      comments_count 1
      members_count 1
      watchers_ids "MyString"
      tasks_count 1
      task_lists_count 1
      conversations_count 1
      last_conversation_id 1
      track_time false
      archived false
      public false
      deleted false
    end
end