class HomeController < ApplicationController
  def index
    @movies = "Pulp Fiction"
    @movie_image = TMDBService.movie_image
  end
end
