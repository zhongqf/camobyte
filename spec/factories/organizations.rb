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
end