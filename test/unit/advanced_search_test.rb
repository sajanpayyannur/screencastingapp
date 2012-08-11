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

require 'test_helper'

class AdvancedSearchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
