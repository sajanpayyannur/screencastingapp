class RemoveFixedFromAdvancedSearch < ActiveRecord::Migration
  def up
    remove_column :advanced_searches, :fixed
      end

  def down
    add_column :advanced_searches, :fixed, :string
  end
end
