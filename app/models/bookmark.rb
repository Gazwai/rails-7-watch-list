class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :overview, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: list }
end
