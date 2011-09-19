# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization do
      name "MyString"
      permalink "MyString"
      description "MyText"
      domain "MyString"
      settings "MyText"
      deleted false
    end
end# == Schema Information
#
# Table name: organizations
#
#  id          :integer(4)      not null, primary key
#  company_id  :integer(4)
#  name        :string(255)
#  permalink   :string(255)
#  description :text
#  domain      :string(255)
#  settings    :text
#  deleted     :boolean(1)      default(FALSE), not null
#  created_at  :datetime
#  updated_at  :datetime
#

