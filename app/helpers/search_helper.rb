module SearchHelper
  # NOTE API ALSO SUPPORTS MULTI SEARCH (movie, tv person) with search/multi
  # http://docs.themoviedb.apiary.io/
  # TODO: majority of multi word searches not working for rt...
  def find_movies(query)
    tmdb = client.get("#{tmdb_endpoint}/search/movie", get_options(query))['results']
    #rt = JSON.parse(client.get("#{rt_endpoint}/movies.json", get_rt_options(query)))['movies']
    #harmonize_results(tmdb, rt)
  end

  def find_people(query)
    client.get("#{tmdb_endpoint}/search/person", get_options(query))['results']
  end

  private

    def get_rt_options(query)
      {
        query: {
          apikey: ROTTENTOMATOES_CONFIG['api_key'],
          q: CGI::escape(query)
        }
      }
    end

    def get_options(query)
       {
         body: {
           api_key: THEMOVIEDB_CONFIG['api_key'],
           query: CGI::escape(query)
         }
       }
    end

    # NOTE: currently disabling, as it is slow and rarely returns results
    # merge rottentomatoes data where applicable
    def harmonize_results(tmdb, rt)
      tmdb.each do |movie|
        match = rt.find { |rotten| movie['title'] == rotten['title'] }
        if match
          movie.merge!({
            rotten_score: match['ratings']['critics_score'],
            rotten_url: match['links']['alternate'],
            imdb_id: match['alternate_ids'].try(:[], 'imdb')
          })
        end
      end
    end
end
