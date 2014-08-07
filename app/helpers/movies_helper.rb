module MoviesHelper

  def get_upcoming_movies
    get_movies('upcoming')
  end

  def get_now_playing_movies
    get_movies('now_playing')
  end

  def get_popular_movies
    get_movies('popular')
  end

  def get_top_rated_movies
    get_movies('top_rated')
  end

  private
    def get_movies(category)
      options = { body: { api_key: THEMOVIEDB_CONFIG['api_key'] }}
      client.get("#{endpoint}/#{category}", options)['results']
    end

    def endpoint
      'http://api.themoviedb.org/3/movie'
    end

    def client
      HTTParty
    end
end
