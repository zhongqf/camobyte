require 'spec_helper'

describe Company do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
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

