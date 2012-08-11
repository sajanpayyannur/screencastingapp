class AddMarkToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :mark, :string
  end
end
