class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true
  validates :overview, length: { minimum: 10 }
end
