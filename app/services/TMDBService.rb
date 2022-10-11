module TMDBService
  URL = Rails.configuration.tmdb_url
  TOKEN = Rails.configuration.tmdb_api_key

  def initialize
  end

  class << self
    def movies
      formatted_movie_url = URL + "/discover/movie?sort_by=popularity.desc&api_key=" + TOKEN
      response = Faraday.get(formatted_movie_url)
      parsed_response = JSON.parse(response.body)["results"]
    end

    def image_url(poster_path)
      "https://www.themoviedb.org/t/p/w440_and_h660_face/" + poster_path
    end
  end
end
