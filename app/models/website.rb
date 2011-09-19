class Website < ActiveRecord::Base
  belongs_to :user

  TYPES = ['Work','Personal','Other']
  
  def get_type
    TYPES[account_type]
  end
  
  def to_url
      if name.include? "://"
          name
      else
          "http://#{name}"
      end
  end
end
# == Schema Information
#
# Table name: websites
#
#  id           :integer(4)      not null, primary key
#  profile_id   :integer(4)
#  value        :string(255)
#  account_type :integer(4)      default(0)
#

