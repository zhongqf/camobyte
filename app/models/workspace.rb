class Workspace < ActiveRecord::Base
  include Immortal

  # associations
  belongs_to :owner, :class_name => "User"
  belongs_to :organization

  with_options :dependent => :delete_all do |d|

    d.with_options :as => :user_group do |asug|
  
      asug.has_many :members
      asug.has_many :invitations

      asug.with_options :order => "id DESC" do |o|
        o.has_many :conversations
        o.has_many :comments
        o.has_many :activities
      end

    end

    d.has_many :task_lists
    d.has_many :tasks
  end

  has_many :users, :through => :members, :source => :user

  #validations
  validates :owner, :presence => true
  validates :name, :presence => true, :uniqueness => true, :length => {:within => 4..20}
  validates :permalink, :presence => true, :uniqueness => true, :length => {:within => 6..20}

  #hooks
  after_create :add_owner_and_log_create


  #methods

  def owner?(user)
    self.owner && self.owner == user
  end

  def add_user(user, params = {})
    unless has_member?(user)
      member = self.members.with_deleted.where(:user_id => user.id).first
      member ||= members.build(:user => user, :deleted => false)
      member.role = params[:role] if params[:role]
      member.source_user_id = params[:source_user].try(:id)
      member.save
      member
    end
  end

  def has_member?(user)
    user && members.exists?(:user_id => user.id)
  end

  def log_activities(target, action, user = nil)

  end

  protected
    def add_owner_and_log_create
      add_user(owner, :role => :owner )
      log_activities(self, 'create', owner_id)
    end

end
# == Schema Information
#
# Table name: workspaces
#
#  id                   :integer(4)      not null, primary key
#  organization_id      :integer(4)
#  owner_id             :integer(4)
#  name                 :string(255)
#  permalink            :string(255)
#  last_comment_id      :integer(4)
#  comments_count       :integer(4)      default(0)
#  members_count        :integer(4)      default(0)
#  watchers_ids         :string(255)
#  tasks_count          :integer(4)      default(0)
#  task_lists_count     :integer(4)      default(0)
#  conversations_count  :integer(4)      default(0)
#  last_conversation_id :integer(4)
#  track_time           :boolean(1)      default(FALSE)
#  archived             :boolean(1)      default(FALSE)
#  public               :boolean(1)
#  deleted              :boolean(1)      default(FALSE), not null
#  created_at           :datetime
#  updated_at           :datetime
#

