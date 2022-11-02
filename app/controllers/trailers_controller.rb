class TrailersController < ApplicationController
  # require 'json'

  def show
    @trailer = TMDBService.official_trailer(params[:id])
    render json: @trailer#.to_json
  end

  private
  def trailer_params
    params.permit(:id)
  end
end
