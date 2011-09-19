class Profile < ActiveRecord::Base

  belongs_to :user
  has_many :phone_numbers, :dependent => :destroy
  has_many :addresses, :dependent => :destroy
  has_many :email_addresses, :dependent => :destroy
  has_many :websites, :dependent => :destroy
  has_many :ims, :dependent => :destroy
  has_many :social_networks, :dependent => :destroy
  
  concerned_with  :avatar
  
  with_options :allow_destroy => true, :reject_if => proc { |a| a['value'].blank? } do |profile|
    profile.accepts_nested_attributes_for :phone_numbers
    profile.accepts_nested_attributes_for :email_addresses
    profile.accepts_nested_attributes_for :websites
    profile.accepts_nested_attributes_for :ims
    profile.accepts_nested_attributes_for :social_networks
  end
  
  accepts_nested_attributes_for :addresses, :allow_destroy => true, :reject_if => proc { |address|
    address['street'].blank? and address['city'].blank?
  }

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
#

