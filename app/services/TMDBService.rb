module TMDBService
  URL = Rails.configuration.tmdb_url
  TOKEN = Rails.configuration.tmdb_api_key

  def initialize
  end

  class << self
    def movies(sort_by)
      formatted_movie_url = URL + "/discover/movie?sort_by=#{sort_by}.desc&certification_country=US&certification.gte=PG-13&vote_count.gte=3000&api_key=" + TOKEN
      response = Faraday.get(formatted_movie_url)
      parsed_response = JSON.parse(response.body)["results"]
    end

    def shows(sort_by)
      formatted_movie_url = URL + "/discover/tv?sort_by=#{sort_by}.desc&api_key=" + TOKEN
      response = Faraday.get(formatted_movie_url)
      parsed_response = JSON.parse(response.body)["results"]
    end

    def image_url(poster_path)
      if poster_path
        "https://www.themoviedb.org/t/p/w440_and_h660_face/" + poster_path
      end
    end

    def official_trailer(movie_id)
      videos_url = URL + "/movie/#{movie_id}/videos?api_key=" + TOKEN
      response = Faraday.get(videos_url)
      parsed_response = JSON.parse(response.body)["results"]
      teaser = trailer(parsed_response)
      trailer_url(teaser["key"])
    end

    def trailer(videos)
      videos.find { |t| t["type"] == "Trailer" } || videos.first
    end

    def trailer_url(youtube_id)
      { trailer_url: "https://www.youtube.com/embed/#{youtube_id}" }
    end
  end
end
