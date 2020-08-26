class AssaultCategory < ApplicationRecord
  has_many :protest_assaults
  has_many :protests, through: :protest_assaults
  validates :name, presence: true, uniqueness: true
end
