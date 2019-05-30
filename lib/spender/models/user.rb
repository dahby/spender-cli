class User < ActiveRecord::Base
  has_many :transactions
  has_many :locations, through: :transactions

  def display_transactions
    self.transactions.each do |i|
      puts "#{i.location.name} - $#{i.total_price}"
    end
  end
end