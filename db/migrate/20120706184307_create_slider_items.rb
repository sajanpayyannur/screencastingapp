class CreateSliderItems < ActiveRecord::Migration
  def change
    create_table :slider_items do |t|
      t.string :title
      t.string :url
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end
