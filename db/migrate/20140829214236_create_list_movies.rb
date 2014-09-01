class CreateListMovies < ActiveRecord::Migration
  def change
    create_table :list_movies do |t|
      t.string :title
      t.string :imdb_id
      t.integer :tmdb_id
      t.integer :list_id
      t.string :poster_path

      t.timestamps
    end
  end
end
