class CreateAdvancedSearches < ActiveRecord::Migration
  def change
    create_table :advanced_searches do |t|
      t.string :make
      t.string :model
      t.string :year_from
      t.string :year_to
      t.string :lot_number
      t.string :title
      t.string :state
      t.string :make_an_offer_eligible
      t.string :fixed
      t.references :user

      t.timestamps
    end
    add_index :advanced_searches, :user_id
  end
end
