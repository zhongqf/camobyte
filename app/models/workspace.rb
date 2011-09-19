class Workspace < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :members, :as => :user_group
  has_many :users, :through => :members

  has_many :task_lists
  

end
# == Schema Information
#
# Table name: workspaces
#
#  id                   :integer(4)      not null, primary key
#  organization_id      :integer(4)
#  owner_id             :integer(4)
#  name                 :string(255)
#  permalink            :string(255)
#  last_comment_id      :integer(4)
#  comments_count       :integer(4)      default(0)
#  members_count        :integer(4)      default(0)
#  watchers_ids         :string(255)
#  tasks_count          :integer(4)      default(0)
#  task_lists_count     :integer(4)      default(0)
#  conversations_count  :integer(4)      default(0)
#  last_conversation_id :integer(4)
#  track_time           :boolean(1)      default(FALSE)
#  archived             :boolean(1)      default(FALSE)
#  public               :boolean(1)
#  deleted              :boolean(1)      default(FALSE), not null
#  created_at           :datetime
#  updated_at           :datetime
#

