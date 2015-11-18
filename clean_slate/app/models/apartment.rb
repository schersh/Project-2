class Apartment < ActiveRecord::Base
  has_many :users
  has_many :expenses, through: :users 
end
