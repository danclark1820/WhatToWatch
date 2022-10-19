class HomeController < ApplicationController
  def index
    @popular_movies = TMDBService.movies("popularity")
    @highest_rated_movies = TMDBService.movies("vote_average")
    # @popular_shows = TMDBService.shows("popularity")
    # @highest_rated_shows = TMDBService.shows("votes")
  end
end
