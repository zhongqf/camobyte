class Activity < ActiveRecord::Base
end
# == Schema Information
#
# Table name: activities
#
#  id                  :integer(4)      not null, primary key
#  user_id             :integer(4)
#  target_id           :integer(4)
#  target_type         :string(255)
#  user_group_id       :integer(4)
#  user_group_type     :string(255)
#  comment_target_id   :integer(4)
#  comment_target_type :string(255)
#  action              :string(255)
#  deleted             :boolean(1)      default(FALSE), not null
#  created_at          :datetime
#  updated_at          :datetime
#

