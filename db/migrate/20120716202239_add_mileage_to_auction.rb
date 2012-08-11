class AddMileageToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :mileage, :float
  end
end
