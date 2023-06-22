class Api::V1::MoviesController < ActionController::API
  # POST /api/v1/movies/import_catalog
  def import_catalog
    head 200
  end

  # GET /api/v1/movies/list_catalog
  def list_catalog
    @movies = Movie.all
    render json: @movies, status: 200
  end
end