class User < ActiveRecord::Base
  has_many :transactions
  has_many :locations, through: :transactions
end