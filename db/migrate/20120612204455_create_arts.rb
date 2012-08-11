class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
