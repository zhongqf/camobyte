class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  
  has_one :profile
  accepts_nested_attributes_for :profile
  
  before_create :init_user
  
  
  def init_user
    self.profile = Profile.find_or_create_by_email(self.email)
  end
  
  
end
