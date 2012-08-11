class AddFixedToAdvancedSearch < ActiveRecord::Migration
  def change
    add_column :advanced_searches, :fixed, :boolean
  end
end
