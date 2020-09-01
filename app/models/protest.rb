class Protest < ApplicationRecord
  belongs_to :station
  has_many :protest_assaults, dependent: :destroy
  has_many :assault_categories, through: :protest_assaults

  validates :experienced, inclusion: { in: [true, false] }
  validates :date, presence: true
  validates :description, presence: true
  validates :station, presence: true
end
