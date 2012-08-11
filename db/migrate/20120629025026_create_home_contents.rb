class CreateHomeContents < ActiveRecord::Migration
  def change
    create_table :home_contents do |t|
      t.text :left_text
      t.text :right_text

      t.timestamps
    end
  end
end
