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
end# == Schema Information
#
# Table name: task_lists
#
#  id                   :integer(4)      not null, primary key
#  workspace_id         :integer(4)
#  user_id              :integer(4)
#  name                 :string(255)
#  position             :integer(4)
#  last_comment_id      :integer(4)
#  comments_count       :integer(4)      default(0)
#  watchers_ids         :string(255)
#  archived             :boolean(1)      default(FALSE)
#  archived_tasks_count :integer(4)      default(0)
#  tasks_count          :integer(4)      default(0)
#  completed_at         :datetime
#  start_on             :date
#  finish_on            :date
#  deleted              :boolean(1)      default(FALSE), not null
#  created_at           :datetime
#  updated_at           :datetime
#

