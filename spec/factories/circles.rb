# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :circle do
      company_id 1
      owner_id 1
      name "MyString"
      permalink "MyString"
      last_comment_id 1
      comments_count 1
      watchers_ids "MyString"
      conversations_count 1
      last_conversation_id 1
      public false
      deleted false
    end
end# == Schema Information
#
# Table name: circles
#
#  id                   :integer(4)      not null, primary key
#  company_id           :integer(4)
#  owner_id             :integer(4)
#  name                 :string(255)
#  permalink            :string(255)
#  last_comment_id      :integer(4)
#  comments_count       :integer(4)      default(0)
#  watchers_ids         :string(255)
#  conversations_count  :integer(4)      default(0)
#  last_conversation_id :integer(4)
#  public               :boolean(1)
#  deleted              :boolean(1)      default(FALSE), not null
#  created_at           :datetime
#  updated_at           :datetime
#

