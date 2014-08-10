module MoviesHelper

  def find_movie(id)
    options = { body: { api_key: THEMOVIEDB_CONFIG['api_key'] } }
    client.get("#{tmdb_endpoint}/movie/#{id}", options)
  end

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
    JSON.parse(client.get("#{rt_endpoint}/movies/in_theaters.json", options))["movies"]
  end

  private
    def get_movies(category)
      options = { body: { api_key: THEMOVIEDB_CONFIG['api_key'] }}
      client.get("#{tmdb_endpoint}/movie/#{category}", options)['results']
    end
end
