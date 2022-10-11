class HomeController < ApplicationController
  def index
    @movies = TMDBService.movies
  end
end
