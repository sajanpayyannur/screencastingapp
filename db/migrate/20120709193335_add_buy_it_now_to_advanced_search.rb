class AddBuyItNowToAdvancedSearch < ActiveRecord::Migration
  def change
    add_column :advanced_searches, :buy_it_now, :boolean
  end
end
