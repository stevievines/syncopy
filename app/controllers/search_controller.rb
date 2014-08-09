class SearchController < ApplicationController
  include ApplicationHelper
  include SearchHelper
  def index
    @movies = find_movies(params[:query])
    @people = find_people(params[:query])
  end
end
