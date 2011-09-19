# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
      name "MyString"
      permalink "MyString"
      domain "MyString"
      description "MyText"
      language "MyString"
      time_zone "MyString"
      settings "MyText"
      logo_file_name "MyString"
      logo_content_type "MyString"
      logo_file_size 1
      deleted false
    end
end# == Schema Information
#
# Table name: companies
#
#  id                :integer(4)      not null, primary key
#  name              :string(255)
#  permalink         :string(255)
#  domain            :string(255)
#  description       :text
#  language          :string(255)     default("en")
#  time_zone         :string(255)     default("Eastern Time (US & Canada)")
#  settings          :text
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer(4)
#  deleted           :boolean(1)      default(FALSE), not null
#  created_at        :datetime
#  updated_at        :datetime
#

