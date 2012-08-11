# == Schema Information
#
# Table name: payments
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  price              :float
#  transaction_number :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  card_number        :string(255)
#  card_verification  :integer
#  card_expires_on    :date
#  first_name         :string(255)
#  last_name          :string(255)
#  status             :boolean
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
