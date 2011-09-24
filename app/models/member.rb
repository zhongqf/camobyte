class Member < ActiveRecord::Base
  include Immortal

  #associations
  belongs_to :user
  belongs_to :source_user, :class_name => "User"
  belongs_to :user_group, :polymorphic => true

  ROLES = {:owner => 0, :admin => 1, :observer => 2, :commenter => 3, :participant => 4 }


  #hooks
  after_create :log_create
  after_destroy :log_delete


  delegate :name, :login, :to => :user

  def owner?
    user_group.owner?(user)
  end

  def admin?
    self.role == ROLES[:admin]
  end


  protected

  def log_create
    user_group.log_activity(self, 'create', user) unless user_group.owner == user
  end

  def log_delete
    user_group.log_activity(self, 'delete')
  end

  def cleanup
  end

end
# == Schema Information
#
# Table name: members
#
#  id              :integer(4)      not null, primary key
#  user_group_id   :integer(4)
#  user_group_type :string(255)
#  user_id         :integer(4)
#  role            :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#  deleted         :boolean(1)      default(FALSE), not null
#  source_user_id  :integer(4)
#

