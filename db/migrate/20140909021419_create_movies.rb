class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string  :backdrop_path
      t.string  :poster_path
      t.integer :budget
      t.string  :homepage
      t.integer :tmdb_id, null: false
      t.string  :imdb_id
      t.string  :original_title
      t.text    :overview
      t.float   :popularity
      t.date    :release_date
      t.integer :revenue
      t.integer :runtime
      t.string  :status
      t.string  :tagline
      t.string  :title, null: false
      t.float   :vote_average
      t.integer :vote_count

      t.timestamps
    end
    add_index :movies, :tmdb_id
  end
end
