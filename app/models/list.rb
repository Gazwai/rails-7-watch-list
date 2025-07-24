class List < ApplicationRecord
  include PgSearch::Model
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, presence: true
  pg_search_scope :global_search,
                  against: [:name],
                  using: {
                    tsearch: { prefix: true },
                  }
end
