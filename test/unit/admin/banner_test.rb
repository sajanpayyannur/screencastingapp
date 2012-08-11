# == Schema Information
#
# Table name: banners
#
#  id                  :integer          not null, primary key
#  banner_file_name    :string(255)
#  banner_content_type :string(255)
#  banner_file_size    :integer
#  banner_updated_at   :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  link                :string(255)
#  position            :string(255)
#

require 'test_helper'

class Admin::BannerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
