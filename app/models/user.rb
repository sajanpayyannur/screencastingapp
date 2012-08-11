# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      not null
#  encrypted_password     :string(255)      not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  nickname               :string(255)
#  name                   :string(255)
#  description            :text
#  admin                  :boolean
#  phone_number           :string(255)
#  address                :string(255)
#  city                   :string(255)
#  zip                    :string(255)
#  state_id               :integer
#

class User < ActiveRecord::Base
	rolify

  has_many :authentications
  has_many :auctions
  has_many :bids
  has_many :payments
  has_many :transactions
  has_many :advanced_searches
  has_many :watch_lists
  belongs_to :state

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname, :name, :description, :state_id, :address, :city, :zip, :phone_number, :admin

  validates :nickname, uniqueness: true
  validates :name, :nickname, :address, :city, :zip, :state, :presence => true

  before_save :slug_nickname

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password.
      user = User.create!(:email => data.email, :name => data.name,
                          :description => data.bio, :nickname => data.name.parameterize,
                          :address => "Address",
                          :city => "City",
                          :state_id => State.first.id,
                          :zip => "00000",
                          :password => Devise.friendly_token[0,20])
      user.authentications.create!(:provider => access_token['provider'], :uuid => access_token['uid'])
      user.save
      user
    end
  end

  def self.find_for_twitter_oauth(omniauth)
    authentication = Authentication.find_by_provider_and_uuid(omniauth['provider'], omniauth['uid'])
    name = omniauth.info['name']
    nickname = omniauth.info['nickname']
    description = omniauth.info['description'] || name

    if authentication && authentication.user
      authentication.user
    else
      user = User.create!(:email => "#{nickname}@update.me", :name => name, :nickname => nickname,
                          :description => description,
                          :address => "Address",
                          :city => "City",
                          :state_id => State.first.id,
                          :zip => "00000",
                          :password => Devise.friendly_token[0,20])
      user.authentications.create!(:provider => omniauth['provider'], :uuid => omniauth['uid'])
      user.save
      user
    end
  end

  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.where(:email => data["email"]).first
      user
    else
      user = User.create!(:email => data["email"], :name => data["name"],
                          :description => data["name"],
                          :address => "Address",
                          :city => "City",
                          :state_id => State.first.id,
                          :zip => "00000",
                          :nickname => data["email"], :password => Devise.friendly_token[0,20])
      user.authentications.create!(:provider => access_token['provider'], :uuid => access_token['uid'])
      user.save
      user
    end
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end

  def needs_update_email?
    self.authentications.any? && self.email.match(/.*@update.me/)
  end

  def bids_amount
    Bid.bid_amount_for_user(self).first.try(:total) || 0
  end

  def winner_bids
    bids.where(:winner => true)
  end

  def build_setup_fee_payment(params)
    payment = self.payments.build params
    payment.price = setup_fee_value
    payment
  end

  def credits
    self.transactions.where :transaction_type => Transaction.credit
  end

  def debits
    self.transactions.where :transaction_type => Transaction.debit
  end


  def account_balance
    (credit_balance - debit_balance)
  end

  # Should be held 10% of every bid. Not the whole amount (I guess ..)
  # Unless it is less than 400 cause 400 should be the minimum required value held for each bid.
  def locked_balance
    total = transactions.where(:transaction_type => Transaction.debit, :transaction_status => Transaction.pending).map(&:value)
    held = 0
    total.each do |value|
      partial = (value * 10) / 100
      held += partial > 400 ? partial : 400
    end
    held
  end

  def credit_balance
    transactions.where(:transaction_type => Transaction.credit, :transaction_status => Transaction.effected).sum(:value) || 0
  end

  def debit_balance
    transactions.where(:transaction_type => Transaction.debit, :transaction_status => Transaction.effected).sum(:value) || 0
  end

  def available_balance
    (account_balance - locked_balance)
  end

  def is_setup_fee_paid?
    (account_balance >= setup_fee_value)
  end

  def watching?(auction)
    self.watch_lists.where(:auction_id =>auction.id).any?
  end

  def watching_auctions
    self.watch_lists.to_a.map{|w| w.auction}
  end

  private
    def setup_fee_value
      129
    end

    def slug_nickname
      self.nickname = self.nickname.parameterize if self.nickname
    end
end
