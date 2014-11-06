class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.string :card_type
      t.integer :card_number
      t.integer :cvv
      t.integer :month
      t.integer :year
      t.boolean :status

      t.timestamps
    end
  end
end
