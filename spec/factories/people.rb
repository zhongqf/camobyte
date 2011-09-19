# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
      user_id 1
      organization_id 1
      role 1
    end
end# == Schema Information
#
# Table name: people
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  organization_id :integer(4)
#  role            :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

