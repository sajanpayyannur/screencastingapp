class AddCardFieldsToPayments < ActiveRecord::Migration
  def up
    add_column :payments, :card_number, :string
    add_column :payments, :card_verification, :integer
    add_column :payments, :card_expires_on, :date
    add_column :payments, :first_name, :string
    add_column :payments, :last_name, :string
    remove_column :payments, :status

    add_index :payments, :user_id
  end

  def down
    remove_column :payments, :card_number
    remove_column :payments, :card_verification
    remove_column :payments, :card_expires_on
    remove_column :payments, :first_name
    remove_column :payments, :last_name
    add_column :payments, :status, :string

    remove_index :payments, :user_id
  end
end
