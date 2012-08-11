class MakeSlugUniqueToPages < ActiveRecord::Migration
  def up
    remove_index :admin_pages, :slug
    add_index :admin_pages, :slug, unique: true
  end

  def down
  end
end
