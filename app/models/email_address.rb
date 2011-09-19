class EmailAddress < ActiveRecord::Base
  belongs_to :user

  TYPES = ['Work','Home','Other']
  
  def get_type
    TYPES[account_type]
  end

end
# == Schema Information
#
# Table name: email_addresses
#
#  id           :integer(4)      not null, primary key
#  profile_id   :integer(4)
#  value        :string(255)
#  account_type :integer(4)      default(0)
#

