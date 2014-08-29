class MoviesController < ApplicationController
  include MoviesHelper
  include ApplicationHelper

  def index
    @popular = get_popular_movies
    @upcoming = get_upcoming_movies
    @now_playing = get_now_playing_movies
    @top_rated = get_top_rated_movies
  end

  def show
    @movie = find_movie(params[:id])
    @videos = get_videos(params[:id])

    images = get_images(params[:id])
    @english_posters = Array.wrap(images['posters']).select do |poster|
      poster["iso_639_1"] == "en"
    end

    credits = get_credits(params[:id])
    @cast = credits['cast']
    @crew = credits['crew']
    @directors = @crew.select { |c| c['job'] == 'Director' }.map { |d| d['name'] }


    if @movie['imdb_id']
      @imdb_link = "http://www.imdb.com/title/#{@movie['imdb_id']}"
    end
  end

end
