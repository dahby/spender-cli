class User < ActiveRecord::Base
  has_many :transactions
  has_many :locations, through: :transactions

  def transactions_by_most_recent
    self.transactions.reverse
  end

  def display_transactions
    self.transactions_by_most_recent.each.with_index do |transaction, i|
      # binding.pry
      day = transaction.created_at.day
      month = transaction.created_at.month
      location_name = transaction.location.name
      price = transaction.price
      puts "#{i+1}: #{month}-#{day} - #{location_name} - $#{price}"
    end
  end

  def select_transaction(num)
    transactions_by_most_recent[num - 1]
  end

  def total_for_all_transactions
    total = 0
    self.transactions.each do |transaction|
      total += transaction.price
    end
    total
  end
end