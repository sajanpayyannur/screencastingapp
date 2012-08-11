class RemoveStateFromAdvancedSearch < ActiveRecord::Migration
  def up
    remove_column :advanced_searches, :state
      end

  def down
    add_column :advanced_searches, :state, :string
  end
end
