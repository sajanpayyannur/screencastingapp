# == Schema Information
#
# Table name: admin_menu_entries
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  order         :integer
#  admin_page_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class Admin::MenuEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
