class CreateAuctions < ActiveRecord::Migration

  def up
    create_table :auctions do |t|
      t.references :user
      t.string :title
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.float :price
      t.string :city
      t.string :state
      t.string :zip_code
      t.datetime :end_date
      t.string :type
      t.integer :year
      t.text :description

      t.timestamps
    end
    add_index :auctions, :user_id
  end

  def down
    drop_table :auctions
  end

end
