# == Schema Information
#
# Table name: admin_logos
#
#  id                 :integer          not null, primary key
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class Admin::LogoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
