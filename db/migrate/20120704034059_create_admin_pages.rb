class CreateAdminPages < ActiveRecord::Migration
  def change
    create_table :admin_pages do |t|
      t.string :title
      t.string :slug
      t.boolean :publish
      t.text :text

      t.timestamps
    end

    add_index :admin_pages, :slug
  end
end
