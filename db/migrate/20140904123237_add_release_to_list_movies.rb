class AddReleaseToListMovies < ActiveRecord::Migration
  def change
    add_column :list_movies, :release_date, :date
  end
end
