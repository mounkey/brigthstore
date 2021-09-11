class Category < ApplicationRecord
  has_many :wears
  has_one_attached :photo
  validates :nombre, presence: true
end
