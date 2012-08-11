class CreateWatchLists < ActiveRecord::Migration
  def change
    create_table :watch_lists do |t|
      t.references :user
      t.references :auction

      t.timestamps
    end
    add_index :watch_lists, :user_id
    add_index :watch_lists, :auction_id
  end
end
