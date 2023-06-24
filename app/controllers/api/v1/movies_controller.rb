class Api::V1::MoviesController < ActionController::API
  # POST /api/v1/movies/import_catalog
  def import_catalog
    movie_service = MovieService.new
    @data = movie_service.import

    render json: @data[:message], status: @data[:status]
  end
  # GET /api/v1/movies/list_catalog
  def list_catalog
    movie_service = MovieService.new
    movies = movie_service.filters(params)
    
    render json: movies.order('year DESC'), status: 200
  end
end
