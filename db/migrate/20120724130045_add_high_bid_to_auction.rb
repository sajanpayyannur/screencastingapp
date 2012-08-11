class AddHighBidToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :high_bid, :float
  end
end
