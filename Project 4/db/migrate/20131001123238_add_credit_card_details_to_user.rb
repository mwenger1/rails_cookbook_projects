class AddCreditCardDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :card_type, :string
    add_column :users, :credit_card, :integer
    add_column :users, :cvv, :integer
    add_column :users, :month, :integer
    add_column :users, :year, :integer
  end
end
