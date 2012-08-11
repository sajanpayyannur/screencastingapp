# == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  auction_id :integer
#  value      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  winner     :boolean          default(FALSE)
#  active     :boolean          default(TRUE)
#

require 'test_helper'

class BidTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
