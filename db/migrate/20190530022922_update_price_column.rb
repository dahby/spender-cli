class UpdatePriceColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :transactions, :total_price, :price
  end
end
