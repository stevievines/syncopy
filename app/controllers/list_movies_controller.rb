class ListMoviesController < ApplicationController
  before_action :signed_in_user

  def create
    # here we need to do a find_or_create on the movie
    # and then create the list movie
    # but can't get the movie to this from view for some reason
    binding.pry
  end

  private
    def list_movie_params
       params.require(:list_movie).permit(:list_id, :movie_id)
    end
end
