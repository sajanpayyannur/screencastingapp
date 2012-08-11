class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :title
      t.float :value, :default => 0
      t.string :transaction_type
      t.string :transactionable_type
      t.integer :transactionable_id
      t.string :transaction_status, :default => "P"

      t.timestamps
    end
  end
end
