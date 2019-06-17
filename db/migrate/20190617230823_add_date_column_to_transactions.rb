class AddDateColumnToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :purchase_date, :datetime
  end
end
