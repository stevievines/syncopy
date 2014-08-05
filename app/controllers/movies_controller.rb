class MoviesController < ApplicationController

  def test_popular
    options = { body: { api_key: '6e6c104064b6bffec90b0105d58cfe8e'}}
    client.get("#{endpoint}/popular", options)['results']
  end

  def index
    @movies = test_popular
  end

  private
    def endpoint
      'http://api.themoviedb.org/3/movie'
    end

    def client
      HTTParty
    end
end
