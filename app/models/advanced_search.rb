# == Schema Information
#
# Table name: advanced_searches
#
#  id                     :integer          not null, primary key
#  make                   :string(255)
#  model                  :string(255)
#  year_from              :string(255)
#  year_to                :string(255)
#  lot_number             :string(255)
#  title                  :string(255)
#  user_id                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  state_id               :integer
#  buy_it_now             :boolean
#  fixed                  :boolean
#  make_an_offer_eligible :boolean
#  slug                   :string(255)
#  transmission           :string(255)
#  body_color             :string(255)
#  body_style             :string(255)
#  drive_train            :string(255)
#  vehicle_condition      :string(255)
#  closes_today           :boolean
#  closes_tomorrow        :boolean
#  sale_title_type_id     :integer
#  mileage                :string(255)
#

class AdvancedSearch < ActiveRecord::Base
  extend FriendlyId
  belongs_to :user
  belongs_to :state
  has_and_belongs_to_many :sale_title_types
  attr_accessible :fixed, :lot_number, :make, :make_an_offer_eligible, :model, :state, :title, :year_from, :year_to, :state_id, :buy_it_now,
    :fixed                 ,
    :make_an_offer_eligible,
    :slug                  ,
    :transmission          ,
    :mileage               ,
    :body_color            ,
    :body_style            ,
    :drive_train           ,
    :vehicle_condition     ,
    :closes_today          ,
    :closes_tomorrow       ,
    :sale_title_type_ids

  validates_presence_of :title
  friendly_id :title, use: :slugged

  def to_s
    "#{title}, #{lot_number}, #{make}, #{model}, #{year_to}, #{year_from}"
  end
end
