# == Schema Information
#
# Table name: slider_items
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  image      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SliderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
