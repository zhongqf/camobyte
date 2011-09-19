class Address < ActiveRecord::Base
  belongs_to :user

  TYPES = ['Work','Home','Other']
  
  def get_type
    TYPES[account_type]
  end
end
# == Schema Information
#
# Table name: addresses
#
#  id           :integer(4)      not null, primary key
#  profile_id   :integer(4)
#  street       :string(255)
#  city         :string(255)
#  state        :string(255)
#  zip          :string(255)
#  country      :string(255)
#  account_type :integer(4)      default(0)
#

