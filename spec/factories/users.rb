# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email
    password "papapa"
    password_confirmation "papapa"
  end

  factory :zhongqf, :parent => :user do
    email "zhongqf@gmail.com"
  end
end
