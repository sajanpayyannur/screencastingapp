class CreateSaleTitleTypes < ActiveRecord::Migration
  def change
    create_table :sale_title_types do |t|
      t.references :state
      t.string :code
      t.string :description

      t.timestamps
    end
    add_index :sale_title_types, :state_id
  end
end
