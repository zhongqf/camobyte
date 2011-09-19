class Person < ActiveRecord::Base
  include Immortal
end
# == Schema Information
#
# Table name: people
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  organization_id :integer(4)
#  role            :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#  deleted         :boolean(1)      default(FALSE), not null
#

