class AddStateIdToAdvancedSearch < ActiveRecord::Migration
  def change
    add_column :advanced_searches, :state_id, :integer
  end
end
