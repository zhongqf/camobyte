class Activity < ActiveRecord::Base
  include Immortal

  #associations

  belongs_to :user
  belongs_to :target, :polymorphic => true
  belongs_to :user_group, :polymorphic => true
  belongs_to :comment_target, :polymorphic => true

  

  def self.log(user_group, target, action, user)

    if target.is_a? Comment
      comment_target = target.target
      #touch activity related to that comment's thread .... TODO: not understand
      Activity.where(:target_id => comment_target_id, :target_type => comment_target_type).last.try(:touch)
    end

    activity = Activity.new(
      :user_group => user_group,
      :target => target,
      :action => action,
      :user => user,
      :comment_target => comment_target)
    activity.created_at = target.try(:created_at) || nil
    activity.save


    activity

  end
end
# == Schema Information
#
# Table name: activities
#
#  id                  :integer(4)      not null, primary key
#  user_id             :integer(4)
#  target_id           :integer(4)
#  target_type         :string(255)
#  user_group_id       :integer(4)
#  user_group_type     :string(255)
#  comment_target_id   :integer(4)
#  comment_target_type :string(255)
#  action              :string(255)
#  deleted             :boolean(1)      default(FALSE), not null
#  created_at          :datetime
#  updated_at          :datetime
#

