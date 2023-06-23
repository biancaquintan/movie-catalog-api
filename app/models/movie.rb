class Movie < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :description, length: { maximum: 500 }
end
