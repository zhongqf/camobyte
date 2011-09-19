class Task < ActiveRecord::Base
end
# == Schema Information
#
# Table name: tasks
#
#  id              :integer(4)      not null, primary key
#  workspace_id    :integer(4)
#  user_id         :integer(4)
#  task_list_id    :integer(4)
#  parent_id       :integer(4)
#  name            :string(255)
#  position        :integer(4)
#  comments_count  :integer(4)      default(0)
#  last_comment_id :integer(4)
#  watchers_ids    :string(255)
#  status          :integer(4)
#  due_on          :date
#  completed_at    :datetime
#  deleted         :boolean(1)      default(FALSE), not null
#  subtasks_count  :integer(4)      default(0)
#  last_subtask_id :integer(4)
#  assignee_ids    :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

