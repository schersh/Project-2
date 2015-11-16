class Apartment < ActiveRecord::Base
  has_many :expenses
  has_many :users
end
