class AddAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :zip, :string
    add_column :users, :state_id, :integer
  end
end
