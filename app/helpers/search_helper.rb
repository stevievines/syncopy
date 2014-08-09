module SearchHelper
  # NOTE API ALSO SUPPORTS MULTI SEARCH (movie, tv person) with search/multi
  # http://docs.themoviedb.apiary.io/
  # TODO: start searching from rottentomatoes too
  def find_movies(query)
    client.get("#{tmdb_endpoint}/search/movie", get_options(query))['results']
  end

  def find_people(query)
    client.get("#{tmdb_endpoint}/search/person", get_options(query))['results']
  end

  private
  def get_options(query)
     {
       body: {
         api_key: THEMOVIEDB_CONFIG['api_key'],
         query: CGI::escape(query)
       }
     }
  end

end
