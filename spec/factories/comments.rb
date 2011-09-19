# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
      target_id 1
      target_type "MyString"
      user_id 1
      body "MyText"
      body_html "MyText"
      status 1
      deleted false
    end
end# == Schema Information
#
# Table name: comments
#
#  id          :integer(4)      not null, primary key
#  target_id   :integer(4)
#  target_type :string(255)
#  user_id     :integer(4)
#  body        :text
#  body_html   :text
#  status      :integer(4)
#  deleted     :boolean(1)      default(FALSE), not null
#  created_at  :datetime
#  updated_at  :datetime
#

