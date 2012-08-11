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

class Payment < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, class_name: "PaymentTransaction"

  attr_accessible :card_number, :card_verification, :card_expires_on, :first_name, :last_name, :price

  validate :validate_card

  after_create :purchase

  private
    # No need to add card_type here
    # Active Merchant docs says "Validating the card automatically detects the card type"
    def credit_card
      @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :number             => card_number,
        :verification_value => card_verification,
        :month              => card_expires_on.month,
        :year               => card_expires_on.year,
        :first_name         => first_name,
        :last_name          => last_name
      )
    end

    # Charges $123 on user credit card. Price should be in cents.
    def purchase
      response = GATEWAY.purchase(self.price * 100, credit_card)
      transactions.create!(:price => self.price, :response => response)
      self.transaction_number = response.subscription_id if response.respond_to? :subscription_id
      self.status = response.success?
      create_transaction if self.status
      self.save
    end

    def create_transaction
      t = Transaction.new
      t.title = 'payment entry'
      t.transactionable = self
      t.value = self.price
      t.transaction_type = Transaction.credit
      t.transaction_status = Transaction.effected
      t.user = self.user
      t.save
    end

    def validate_card
      unless credit_card.valid?
        credit_card.errors.full_messages.each do |message|
          errors[:base] << message
        end
      end
    end
end
