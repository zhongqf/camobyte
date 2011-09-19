# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invitation do
      user_id 1
      target_id 1
      target_type "MyString"
      role 1
      email "MyString"
      invited_user_id 1
      token "MyString"
      deleted false
    end
end# == Schema Information
#
# Table name: invitations
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  target_id       :integer(4)
#  target_type     :string(255)
#  role            :integer(4)
#  email           :string(255)
#  invited_user_id :integer(4)
#  token           :string(255)
#  deleted         :boolean(1)      default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

# == Schema Information
#
# Table name: invitations
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  user_group_id   :integer(4)
#  user_group_type :string(255)
#  role            :integer(4)
#  email           :string(255)
#  invited_user_id :integer(4)
#  token           :string(255)
#  deleted         :boolean(1)      default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

# == Schema Information
#
# Table name: invitations
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  user_group_id   :integer(4)
#  user_group_type :string(255)
#  role            :integer(4)
#  email           :string(255)
#  invited_user_id :integer(4)
#  token           :string(255)
#  deleted         :boolean(1)      default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

# == Schema Information
#
# Table name: invitations
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  user_group_id   :integer(4)
#  user_group_type :string(255)
#  role            :integer(4)
#  email           :string(255)
#  invited_user_id :integer(4)
#  token           :string(255)
#  deleted         :boolean(1)      default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

# == Schema Information
#
# Table name: invitations
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  user_group_id   :integer(4)
#  user_group_type :string(255)
#  role            :integer(4)
#  email           :string(255)
#  invited_user_id :integer(4)
#  token           :string(255)
#  deleted         :boolean(1)      default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

