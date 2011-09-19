require 'spec_helper'

describe Profile do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: profiles
#
#  id                  :integer(4)      not null, primary key
#  email               :string(255)
#  login               :string(255)
#  first_name          :string(255)
#  last_name           :string(255)
#  common_name         :string(255)
#  biography           :text
#  time_zone           :string(255)
#  locale              :string(255)
#  first_day_of_week   :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer(4)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer(4)
#  avatar_updated_at   :datetime
#  deleted             :boolean(1)      default(FALSE), not null
#

