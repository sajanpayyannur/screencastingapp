class AddSomeFieldsToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :transmission, :string
    add_column :auctions, :drive_train, :string
    add_column :auctions, :vehicle_condition, :string
  end
end
