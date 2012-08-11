class AddBuyItNowPriceToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :buy_it_now_price, :string
  end
end
