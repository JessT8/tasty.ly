class Restaurant < ApplicationRecord
  belongs_to :owner
  has_many :foods
  has_and_belongs_to_many :users
end