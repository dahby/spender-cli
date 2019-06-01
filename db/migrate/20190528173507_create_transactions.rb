class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :location_id
      t.float :total_price

      t.timestamps
    end
  end
end
