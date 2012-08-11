class CreateCsvfiles < ActiveRecord::Migration
  def change
    create_table :csvfiles do |t|
      t.string :csv_file_name
      t.string :csv_content_type
      t.integer :csv_file_size
      t.datetime :csv_updated_at

      t.timestamps
    end
  end
end
