class CreateAdminMenuEntries < ActiveRecord::Migration
  def change
    create_table :admin_menu_entries do |t|
      t.string :title
      t.integer :order
      t.integer :admin_page_id

      t.timestamps
    end
  end
end
