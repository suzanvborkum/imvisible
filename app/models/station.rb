class Station < ApplicationRecord
  validates :name, uniqueness: true
end
