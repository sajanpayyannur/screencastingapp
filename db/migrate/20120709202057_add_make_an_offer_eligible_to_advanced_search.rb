class AddMakeAnOfferEligibleToAdvancedSearch < ActiveRecord::Migration
  def change
    add_column :advanced_searches, :make_an_offer_eligible, :boolean
  end
end
