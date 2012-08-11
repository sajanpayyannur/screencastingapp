class AddMakeAnOfferToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :make_an_offer_eligible, :string
  end
end
