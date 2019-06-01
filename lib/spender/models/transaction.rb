class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  def update_price(new_price)
    self.update(price: new_price)
  end
end