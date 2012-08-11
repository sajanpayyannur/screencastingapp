# == Schema Information
#
# Table name: admin_pages
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  slug       :string(255)
#  publish    :boolean
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class Admin::PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
