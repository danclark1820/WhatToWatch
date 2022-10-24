class TrailersController < ApplicationController
  def show
    TMDBService.trailer_url(id)
  end
end
