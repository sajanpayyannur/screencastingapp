class AdvancedSearchSaleTitleTypeJoinTable < ActiveRecord::Migration
  def change
    create_table :advanced_searches_sale_title_types, :id => false do |t|
      t.references :advanced_search
      t.references :sale_title_type
    end
  end

end
