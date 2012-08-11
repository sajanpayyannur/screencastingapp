class AddModelToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :model, :string
  end
end
