class RemoveTitleAndRatingAndPosterUrlToBookmarks < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookmarks, :title, :string
    remove_column :bookmarks, :poster_url, :string
    remove_column :bookmarks, :rating, :float
  end
end
