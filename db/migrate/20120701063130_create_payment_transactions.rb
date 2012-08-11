class CreatePaymentTransactions < ActiveRecord::Migration
  def change
    create_table :payment_transactions do |t|
      t.integer :payment_id
      t.float :price
      t.boolean :success
      t.string :authorization
      t.string :message
      t.text :params

      t.timestamps
    end
    add_index :payment_transactions, :payment_id
    add_column :payments, :status, :boolean
    add_index :payments, :status
  end
end
