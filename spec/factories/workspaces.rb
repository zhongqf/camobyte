# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workspace do
      name
      permalink
      association :owner, :factory => :user
      organization

    end
end