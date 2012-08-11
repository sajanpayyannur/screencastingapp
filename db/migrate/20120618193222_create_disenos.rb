class CreateDisenos < ActiveRecord::Migration
  def change
    create_table :disenos do |t|
      t.references :user
      t.string :name
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
    add_index :disenos, :user_id
  end
end
