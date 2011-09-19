class Im < ActiveRecord::Base
  belongs_to :user

  ACCOUNT_TYPES = ['AIM','MSN','ICQ','Jabber','Yahoo','Skype','QQ','Sametime','Gadu-Gadu','Google Talk','Other']
  TYPES = ['Work','Personal','Other']

  def get_im_type
    ACCOUNT_TYPES[account_im_type]
  end
    
  def get_type
    TYPES[account_type]
  end
end
# == Schema Information
#
# Table name: ims
#
#  id              :integer(4)      not null, primary key
#  profile_id      :integer(4)
#  value           :string(255)
#  account_im_type :integer(4)      default(0)
#  account_type    :integer(4)      default(0)
#

