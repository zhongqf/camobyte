class Organization < ActiveRecord::Base
end
# == Schema Information
#
# Table name: organizations
#
#  id          :integer(4)      not null, primary key
#  company_id  :integer(4)
#  name        :string(255)
#  permalink   :string(255)
#  description :text
#  domain      :string(255)
#  settings    :text
#  deleted     :boolean(1)      default(FALSE), not null
#  created_at  :datetime
#  updated_at  :datetime
#

