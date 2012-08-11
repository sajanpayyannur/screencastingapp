class RemoveMileageFromAuction < ActiveRecord::Migration
  def up
    remove_column :auctions, :mileage
      end

  def down
    add_column :auctions, :mileage, :string
  end
end
