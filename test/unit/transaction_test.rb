# == Schema Information
#
# Table name: transactions
#
#  id                   :integer          not null, primary key
#  title                :string(255)
#  value                :float            default(0.0)
#  transaction_type     :string(255)
#  transactionable_type :string(255)
#  transactionable_id   :integer
#  transaction_status   :string(255)      default("P")
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :integer
#

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
