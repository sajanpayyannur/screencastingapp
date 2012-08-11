class AddMoreFieldsToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :yard_number, :string
    add_column :auctions, :yard_name, :string
    add_column :auctions, :day_of_week, :string
    add_column :auctions, :model_group, :string
    add_column :auctions, :model_detail, :string
    add_column :auctions, :sale_title_type, :string
    add_column :auctions, :has_keys, :string
    add_column :auctions, :odometer_brand, :string
    add_column :auctions, :lot_acv, :string
    add_column :auctions, :engine, :string
    add_column :auctions, :fuel_type, :string
    add_column :auctions, :cylinders, :string
    add_column :auctions, :run_drives, :string
    add_column :auctions, :sale_status, :string
    add_column :auctions, :special_note, :text
    add_column :auctions, :country, :string
    add_column :auctions, :currency_code, :string
  end
end
