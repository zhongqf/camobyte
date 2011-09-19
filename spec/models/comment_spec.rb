require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
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

