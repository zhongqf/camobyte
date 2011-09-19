class Comment < ActiveRecord::Base
  include Immortal
end
# == Schema Information
#
# Table name: comments
#
#  id              :integer(4)      not null, primary key
#  target_id       :integer(4)
#  target_type     :string(255)
#  user_id         :integer(4)
#  body            :text
#  body_html       :text
#  status          :integer(4)
#  deleted         :boolean(1)      default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#  user_group_id   :integer(4)
#  user_group_type :string(255)
#

