# == Schema Information
#
# Table name: sale_title_types
#
#  id          :integer          not null, primary key
#  state_id    :integer
#  code        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SaleTitleTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
