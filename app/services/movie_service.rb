class MovieService
  require 'csv'

  def initialize
    @movies = Movie.all
  end

  def import
    @data = {}

    begin
      CSV.foreach(("lib/files/netflix_titles.csv"), headers: true) do |row|
      
      Movie.create!(
                      genre: row['type'],
                      title: row['title'],
                      country: row['country'],
                      published_at: row['date_added'],
                      year: row['release_year'],
                      description: row['description']
                    )
      end

      @data[:message] =  {message: "Catalog imported successfully!" }
      @data[:status] = :ok
      
    rescue => e
      @data[:message] = { error: e.message }
      @data[:status] = :unprocessable_entity
    end

    @data
  end

  def filters(params)
    unless @movies.first.nil?
      @movies.first.attributes.keys.each do |key|
        @movies = @movies.where("#{key} = ?", params[key]) if params[key]
      end
    end
    @movies
  end
end

