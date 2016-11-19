class User < ApplicationRecord
  has_many :locations
  has_many :visited_cities
end
