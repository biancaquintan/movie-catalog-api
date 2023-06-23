class Api::V1::MoviesController < ActionController::API
  # POST /api/v1/movies/import_catalog
  def import_catalog
    begin
      Movie.import
      render(json: {message: "Catalog imported successfully!"}, status: :ok)
    rescue => e
      render(json: { error: e.message }, status: :unprocessable_entity)
    end
  end

  # GET /api/v1/movies/list_catalog
  def list_catalog
    @movies = Movie.all
    render json: @movies.order('year DESC'), status: 200
  end
end

