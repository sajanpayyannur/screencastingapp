class ChangeActiveFromBid < ActiveRecord::Migration
  def change
    change_column(:bids, :active, :boolean, :default => true)
  end

end
