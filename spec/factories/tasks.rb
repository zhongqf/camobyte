# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
      workspace_id 1
      user_id 1
      task_list_id 1
      parent_id 1
      name "MyString"
      position 1
      comments_count 1
      last_comment_id 1
      watchers_ids "MyString"
      status 1
      due_on "2011-09-17"
      completed_at "2011-09-17 18:26:42"
      deleted false
      subtasks_count 1
      last_subtask_id 1
      assignee_ids "MyString"
    end
end