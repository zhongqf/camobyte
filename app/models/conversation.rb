class Conversation < ActiveRecord::Base
  include Immortal

end
# == Schema Information
#
# Table name: conversations
#
#  id              :integer(4)      not null, primary key
#  user_group_id   :integer(4)
#  user_group_type :string(255)
#  user_id         :integer(4)
#  title           :string(255)
#  last_comment_id :integer(4)
#  comments_count  :integer(4)      default(0)
#  watchers_ids    :string(255)
#  simple          :boolean(1)      default(FALSE)
#  deleted         :boolean(1)      default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

