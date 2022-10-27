class TrailersController < ApplicationController
  def show
    @trailer = TMDBService.official_trailer(params[:id])
    render json: @trailer
  end

  private
  def trailer_params
    params.permit(:id)
  end
end
