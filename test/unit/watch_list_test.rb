# == Schema Information
#
# Table name: watch_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  auction_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class WatchListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
