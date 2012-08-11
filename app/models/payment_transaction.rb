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

class PaymentTransaction < ActiveRecord::Base
  belongs_to :payment

  attr_accessible :price, :response

  def response=(response)
    self.success       = response.success?
    self.authorization = response.authorization
    self.message       = response.message
    self.params        = response.params
  rescue ActiveMerchant::ActiveMerchantError => e
    self.success       = false
    self.authorization = nil
    self.message       = e.message
    self.params        = {}
  end
end
