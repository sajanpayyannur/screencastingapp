class AddSlugToAdvancedSearch < ActiveRecord::Migration
  def change
    add_column :advanced_searches, :slug, :string
  end
end
