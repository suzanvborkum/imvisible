class ProtestAssault < ApplicationRecord
  belongs_to :protest
  belongs_to :assault_category
end
