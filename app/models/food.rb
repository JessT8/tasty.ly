class Food < ApplicationRecord
  belongs_to :restaurant
  has_and_belongs_to_many :users
end