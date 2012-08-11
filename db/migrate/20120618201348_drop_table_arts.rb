class DropTableArts < ActiveRecord::Migration
  def up
    drop_table :arts
  end

  def down
    create_table :arts do |t|
      t.references :user
      t.string :name
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end
end
