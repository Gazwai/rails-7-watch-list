class AddTitleAndRatingAndPosterUrlToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :title, :string
    add_column :bookmarks, :poster_url, :string
    add_column :bookmarks, :rating, :float
  end
end
