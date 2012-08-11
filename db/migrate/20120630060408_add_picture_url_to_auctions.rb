class AddPictureUrlToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :picture_url, :string
    add_column :auctions, :lot_number, :string
  end
end
