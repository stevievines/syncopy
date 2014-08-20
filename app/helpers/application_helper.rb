module ApplicationHelper
  def tmdb_endpoint
    'http://api.themoviedb.org/3'
  end

  def rt_endpoint
    'http://api.rottentomatoes.com/api/public/v1.0'
  end

  def client
    HTTParty
  end

  def full_title(page_title)
    base_title = 'Syncopy'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end
