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

  private
    def get_movies(list)
      options = { body: { api_key: THEMOVIEDB_CONFIG['api_key'] }}
      Array.wrap(client.get("#{tmdb_endpoint}/movie/#{list}", options)['results'])
    end
end
