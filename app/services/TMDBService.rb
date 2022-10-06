module TMDBService
  URL = Rails.configuration.tmdb_url
  TOKEN = Rails.configuration.tmdb_api_key

  def initialize
  end

  class << self
    def movie_image
      formatted_movie_url = URL + "/movie/550?api_key=" + TOKEN
      response = Faraday.get(formatted_movie_url)
      parsed_response = JSON.parse(response.body)
      poster_path = parsed_response["poster_path"]
      formatted_image_url = "https://www.themoviedb.org/t/p/w440_and_h660_face/" + poster_path
    end

    def hello
      "hello"
    end
  end
end
