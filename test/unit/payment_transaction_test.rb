# == Schema Information
#
# Table name: payment_transactions
#
#  id            :integer          not null, primary key
#  payment_id    :integer
#  price         :float
#  success       :boolean
#  authorization :string(255)
#  message       :string(255)
#  params        :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class PaymentTransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
