# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task_list do
      workspace_id 1
      user_id 1
      name "MyString"
      position 1
      last_comment_id 1
      comments_count 1
      watchers_ids "MyString"
      archived false
      archived_tasks_count 1
      tasks_count 1
      completed_at "2011-09-17 18:18:32"
      start_on "2011-09-17"
      finish_on "2011-09-17"
      deleted false
    end
end