class Location < ActiveRecord::Base
  has_many :transactions
  has_many :users, through: :transactions
end