class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to
      t.string :from
      t.string :subject
      t.text :body
      t.integer :messageable_id
      t.string :messageable_type

      t.timestamps
    end
  end
end
