class AddSomeFieldsToAdvancedSearch < ActiveRecord::Migration
  def change
    add_column :advanced_searches, :transmission, :string
    add_column :advanced_searches, :mileage, :string
    add_column :advanced_searches, :body_color, :string
    add_column :advanced_searches, :body_style, :string
    add_column :advanced_searches, :drive_train, :string
    add_column :advanced_searches, :vehicle_condition, :string
    add_column :advanced_searches, :closes_today, :boolean
    add_column :advanced_searches, :closes_tomorrow, :boolean
    add_column :advanced_searches, :sale_title_type_id, :integer
  end
end
