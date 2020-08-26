class ProtestAssault < ApplicationRecord
  belongs_to :protest
  belongs_to :assault_category

  validates_uniqueness_of :protest, :scope => [:assault_category]
end
