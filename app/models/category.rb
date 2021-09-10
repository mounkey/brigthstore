class Category < ApplicationRecord
  has_many :wears
  validates :nombre, presence: true
end
