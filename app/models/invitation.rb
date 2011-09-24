class Invitation < ActiveRecord::Base
  include Immortal

  belongs_to :user
  belongs_to :invited_user, :class_name => "User"
  belongs_to :user_group, :polymorphic => true

  #hooks
  before_create :generate_token
  before_save :copy_user_email, :if => :invited_user
  after_create :send_email



  #accessor
  attr_accessor :is_silent
  attr_accessible :email, :invited_user

  protected
    def generate_token
      self.token ||= SecureRandom.hex(20)
    end

    def copy_user_email
      self.email ||= invited_user.email
    end

    def send_email
      return if @is_silent

      if invited_user
        InvitationSender.project_invitation(self.id).deliver
      else
        InvitationSender.signup_invitation(self.id).deliver
      end
    end

    #need handle_asynchronously?

end
# == Schema Information
#
# Table name: invitations
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  user_group_id   :integer(4)
#  user_group_type :string(255)
#  role            :integer(4)
#  email           :string(255)
#  invited_user_id :integer(4)
#  token           :string(255)
#  deleted         :boolean(1)      default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

