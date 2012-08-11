class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.float :price
      t.string :transaction_number
      t.string :status

      t.timestamps
    end
  end
end
