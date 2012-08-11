class AddImageToArts < ActiveRecord::Migration
  def self.up
    add_column :arts, :image_file_name,    :string
    add_column :arts, :image_content_type, :string
    add_column :arts, :image_file_size,    :integer
    add_column :arts, :image_updated_at,   :datetime
  end

  def self.down
    remove_column :arts, :image_file_name
    remove_column :arts, :image_content_type
    remove_column :arts, :image_file_size
    remove_column :arts, :image_updated_at
  end
end
