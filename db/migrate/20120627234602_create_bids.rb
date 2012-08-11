class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :user
      t.references :auction
      t.float :value

      t.timestamps
    end
    add_index :bids, :user_id
    add_index :bids, :auction_id
  end
end
