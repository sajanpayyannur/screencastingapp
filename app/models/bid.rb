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

class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction
  has_one :transaction, :as => :transactionable
  attr_accessible :value, :auction_id, :user, :user_id, :active, :winner

  scope :charged, where(:winner => true)
  scope :pending, joins(:auction).where(:auctions => {:enabled => true})
  scope :bid_amounts_for_users, select('user_id, sum(value)').group('user_id')
  scope :bid_amount_for_user, lambda{|user|
    select('user_id, sum(value) as total').group('user_id').where(:user_id => user.id)
  }

  after_create :create_transaction

  validates_presence_of :value, :auction, :user
  validates_numericality_of :value
  validate :does_user_have_funds_to_bid?, :on => :create

  def does_user_have_funds_to_bid?
    unless user.available_balance >= ((value * 10) / 100) && user.available_balance > 400
      errors.add(:user, "don't have funds to bid at this auction.")
    end
  end

  def mark_as_won
    self.update_attributes! :active => false, :winner => true
    self.auction.disable
    self.transaction.effect
  end

  def mark_as_lost
    self.update_attributes! :active => false, :winner => false
    self.transaction.cancel
  end

  private

    def create_transaction
      t = Transaction.new
      t.title = 'bid entry'
      t.transactionable = self
      t.value = self.value
      t.transaction_type = Transaction.debit
      t.transaction_status = Transaction.pending
      t.user = self.user
      t.save
    end
end
