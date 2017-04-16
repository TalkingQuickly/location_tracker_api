class User < ApplicationRecord
  devise :database_authenticatable, :registerable
  has_secure_token

  has_many :locations
  has_many :visited_cities
end
