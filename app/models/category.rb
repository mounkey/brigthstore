class Category < ApplicationRecord
  has_many :wears
  validates :name, presence: true
end
