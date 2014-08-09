class MoviesController < ApplicationController
  include MoviesHelper
  include ApplicationHelper

  def index
    @popular = get_popular_movies
    @upcoming = get_upcoming_movies
    @now_playing = get_now_playing_movies
    @top_rated = get_top_rated_movies
    @rottentomatoes = get_in_theatres_tomatoes
  end

end
