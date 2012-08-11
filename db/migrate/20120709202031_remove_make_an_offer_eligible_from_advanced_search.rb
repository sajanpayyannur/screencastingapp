class RemoveMakeAnOfferEligibleFromAdvancedSearch < ActiveRecord::Migration
  def up
    remove_column :advanced_searches, :make_an_offer_eligible
      end

  def down
    add_column :advanced_searches, :make_an_offer_eligible, :string
  end
end
