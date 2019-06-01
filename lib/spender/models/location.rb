class Location < ActiveRecord::Base
  has_many :transactions
  has_many :users, through: :transactions

  def update_name(new_name)
    self.update(name: new_name.capitalize)
  end

  def update_category(new_category)
    self.update(category: new_category.downcase)
  end
end