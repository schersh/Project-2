class Apartment < ActiveRecord::Base
  has_many :expenses
  has_many :roommates
end 
