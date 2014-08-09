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

  def get_in_theatres_tomatoes
    options = {
      query: {
        page_limit: 16,
        page: 1,
        country: 'us',
        apikey: ROTTENTOMATOES_CONFIG['api_key']
      }
    }
    JSON.parse(client.get(rt_endpoint, options))["movies"]
  end

  private
    def get_movies(category)
      options = { body: { api_key: THEMOVIEDB_CONFIG['api_key'] }}
      client.get("#{tmdb_endpoint}/#{category}", options)['results']
    end

    def tmdb_endpoint
      'http://api.themoviedb.org/3/movie'
    end

    def rt_endpoint
      'http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json'
    end

    def client
      HTTParty
    end
end
