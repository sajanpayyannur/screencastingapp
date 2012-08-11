class ChangeTypeNameOnAuctions < ActiveRecord::Migration
  def up
    remove_column :auctions, :type
    add_column :auctions, :kind, :string
  end

  def down
    add_column :auctions, :type, :string
    remove_column :auctions, :kind
  end
end
