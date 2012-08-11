class DropHomeContents < ActiveRecord::Migration
  def up
    drop_table :home_contents
  end

  def down
    create_table :home_contents do |t|
      t.text :left_text
      t.text :right_text

      t.timestamps
    end
  end
end
