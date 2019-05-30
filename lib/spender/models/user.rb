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
end