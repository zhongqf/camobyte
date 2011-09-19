# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
      user_id 1
      target_id 1
      target_type "MyString"
      user_group_id 1
      user_group_type "MyString"
      comment_target_id 1
      comment_target_type "MyString"
      action "MyString"
      deleted false
    end
end# == Schema Information
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

