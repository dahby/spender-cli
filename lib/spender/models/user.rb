class User < ActiveRecord::Base
  has_many :transactions
  has_many :locations, through: :transactions

  def transactions_by_most_recent
    self.transactions.reverse.select do |transaction|
      one_week = Time.now - (60 * 60 * 24 * 7)
      time_at_creation = transaction.created_at
      time_at_creation > one_week
    end
  end

  def display_transactions
    self.transactions_by_most_recent.each.with_index do |transaction, i|
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

  ## Returns a float of price totals for all transactions
  
  def total_for_all_transactions
    total = 0
    self.transactions.each do |transaction|
      total += transaction.price
    end
    total.round(2)
  end

  ## Returns a hash of price totals by category

  def total_for_transactions_by_category
    category_totals = Hash.new(0)
    self.transactions.each do |transaction|
      category = transaction.location.category
      category_totals[category] += transaction.price
    end
    category_totals
  end

  ## Returns a hash of price totals by location name

  def total_for_transactions_by_location_name
    location_totals = Hash.new(0)
    self.transactions.each do |transaction|
      location = transaction.location.name
      location_totals[location] += transaction.price
    end
    location_totals
  end
end