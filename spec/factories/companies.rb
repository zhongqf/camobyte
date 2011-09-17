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
end