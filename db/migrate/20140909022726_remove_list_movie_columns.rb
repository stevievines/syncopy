class RemoveListMovieColumns < ActiveRecord::Migration
  def change
    remove_column :list_movies, :title
    remove_column :list_movies, :imdb_id
    remove_column :list_movies, :tmdb_id
    remove_column :list_movies, :poster_path
  end
end
