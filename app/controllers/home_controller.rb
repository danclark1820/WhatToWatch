class HomeController < ApplicationController
  def index
    @popular_movies = TMDBService.movies(
                        sort_by: params[:sort_by] || "popularity", 
                        order: params[:order] || "desc", 
                        vote_count: params[:votes] || "3000",
                        vote_filter: params[:vote_filter] || "gte", 
                        rating: params[:rating] || "PG-13",
                        rating_filter: params[:rating_filter] || "gte"
                    )
  end
end
