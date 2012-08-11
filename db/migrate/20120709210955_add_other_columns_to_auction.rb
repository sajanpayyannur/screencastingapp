class AddOtherColumnsToAuction < ActiveRecord::Migration
  def up
    add_column :auctions, :color, :string
    add_column :auctions, :body_style, :string
    add_column :auctions, :mileage, :string
    add_column :auctions, :damage_description, :string
    add_column :auctions, :secundary_damage, :string
    add_column :auctions, :title_state, :string
    add_column :auctions, :vin, :string  
  end
  
  def down
    remove_column :auctions, :color
    remove_column :auctions, :body_style
    remove_column :auctions, :mileage
    remove_column :auctions, :damage_description
    remove_column :auctions, :secundary_damage
    remove_column :auctions, :title_state
    remove_column :auctions, :vin
  end
end
