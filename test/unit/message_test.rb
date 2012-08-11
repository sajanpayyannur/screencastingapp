# == Schema Information
#
# Table name: messages
#
#  id               :integer          not null, primary key
#  to               :string(255)
#  from             :string(255)
#  subject          :string(255)
#  body             :text
#  messageable_id   :integer
#  messageable_type :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
