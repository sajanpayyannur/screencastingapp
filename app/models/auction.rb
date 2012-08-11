# == Schema Information
#
# Table name: auctions
#
#  id                     :integer          not null, primary key
#  user_id                :integer
#  title                  :string(255)
#  image_file_name        :string(255)
#  image_content_type     :string(255)
#  image_file_size        :integer
#  image_updated_at       :datetime
#  price                  :float
#  city                   :string(255)
#  state                  :string(255)
#  zip_code               :string(255)
#  end_date               :datetime
#  year                   :integer
#  description            :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  kind                   :string(255)
#  enabled                :boolean          default(TRUE)
#  picture_url            :string(255)
#  lot_number             :string(255)
#  slug                   :string(255)
#  mark                   :string(255)
#  model                  :string(255)
#  make_an_offer_eligible :string(255)
#  buy_it_now_price       :string(255)
#  color                  :string(255)
#  body_style             :string(255)
#  damage_description     :string(255)
#  secundary_damage       :string(255)
#  title_state            :string(255)
#  vin                    :string(255)
#  transmission           :string(255)
#  drive_train            :string(255)
#  vehicle_condition      :string(255)
#  yard_number            :string(255)
#  yard_name              :string(255)
#  day_of_week            :string(255)
#  model_group            :string(255)
#  model_detail           :string(255)
#  sale_title_type        :string(255)
#  has_keys               :string(255)
#  odometer_brand         :string(255)
#  lot_acv                :string(255)
#  engine                 :string(255)
#  fuel_type              :string(255)
#  cylinders              :string(255)
#  run_drives             :string(255)
#  sale_status            :string(255)
#  special_note           :text
#  country                :string(255)
#  currency_code          :string(255)
#  mileage                :float
#  high_bid               :float
#

class Auction < ActiveRecord::Base
  extend CSVAuctionImport
  extend FriendlyId

  friendly_id :title, :use => :slugged

  belongs_to :user
  has_many :bids, :dependent => :destroy
  has_many :watch_lists

  #validates :title, presence: true
  validates_presence_of :title, :price, :city, :state, :zip_code, :kind, :year, :lot_number
  validates_uniqueness_of :lot_number
  attr_accessible :title, :image, :price, :state, :city, :zip_code, :end_date, :kind, :year, :description, :mark, :model,
                  :color, :body_style, :mileage, :damage_description, :secundary_damage, :title_state, :vin

  scope :are_enabled_and_not_expired, where(enabled: true).where('end_date > ?', Time.zone.now)
  scope :are_enabled, where(enabled: true)
  scope :are_expired, where('end_date < ?', Time.zone.now)

  has_attached_file :image,
    :storage => :s3,
    :styles => { :medium => "360x268>", :large => "600x447>" },
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :bucket => 'pwa_arts'

  def watchers_emails
    self.watch_lists.to_a.map{|w| w.user.email}.join(",")
  end

  def self.set_as_disabled
    Auction.are_enabled.are_expired.each(&:disable_and_set_winner)
  end

  def disable_and_set_winner
    self.disable
    if self.bids.any?
      winner = self.bids.order('value desc, id asc').first
      self.bids.each(&:mark_as_lost)
      winner.mark_as_won
    end
  end

  def disable
    self.update_attribute(:enabled, false)
  end

  def max_bid_value
    self.max_bid ? (self.max_bid.value > self.high_bid ? self.max_bid.value : self.high_bid) : self.high_bid
  end

  def max_bid_date
    self.max_bid.created_at.strftime('%d/%m/%y  %H:%M') if self.max_bid && self.max_bid.created_at
  end

  def pretty_title
    self.year.to_s + " " + self.title
  end

  def winner_bid
    self.bids.where(:winner => true).first if self.bids.where(:winner => true).any?
  end

  protected
  def max_bid
    self.bids.order('Bids.value asc').last
  end
end
