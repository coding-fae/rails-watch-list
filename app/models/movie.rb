class Movie < ApplicationRecord
  has_many :bookmark
  validates :title, presence: true
  validates :overview, length: { minimum: 10 }
end
