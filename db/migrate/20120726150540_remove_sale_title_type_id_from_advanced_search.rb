class RemoveSaleTitleTypeIdFromAdvancedSearch < ActiveRecord::Migration
  def up
    remove_column :advanced_searches, :sale_title_type_id
      end

  def down
    add_column :advanced_searches, :sale_title_type_id, :integer
  end
end
