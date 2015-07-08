class AddMovieIdToListMovie < ActiveRecord::Migration
  def change
    add_column :list_movies, :movie_id, :integer
    add_index :list_movies, :movie_id
  end
end
