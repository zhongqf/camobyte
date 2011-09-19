# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
      user_group_id 1
      user_group_type "MyString"
      user_id 1
      role 1
    end
end# == Schema Information
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
#

