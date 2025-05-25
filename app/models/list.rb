class List < ApplicationRecord
  include PgSearch::Model
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, presence: true
  pg_search_scope :global_search,
                  against: [:name],
                  associated_against: {
                    bookmarks: [:comment],
                  },
                  using: {
                    tsearch: { prefix: true },
                  }

  def self.two_level_search(query)
    joins(bookmarks: :movie)
      .where("lists.name ILIKE :query OR bookmarks.comment ILIKE :query OR movies.title ILIKE :query", query: "%#{query}%")
      .distinct
  end
end
