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

class Transaction < ActiveRecord::Base
  include TransactionStatus
  include TransactionType

  belongs_to :transactionable, :polymorphic => true
  belongs_to :user

  attr_accessible :transaction_status, :title, :transactionable_id, :transactionable_type, :transaction_type, :value

  def cancel
    self.update_attributes! :transaction_status => self.class.canceled
  end

  def effect
    self.update_attributes! :transaction_status => self.class.effected
  end
end
