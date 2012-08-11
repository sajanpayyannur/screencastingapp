class AddEnabledToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :enabled, :boolean, default: true
    Auction.update_all(enabled: true)
  end

end
