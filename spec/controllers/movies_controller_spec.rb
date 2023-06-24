require 'rails_helper'

describe 'MoviesController', type: :request do
  
  context 'import_catalog' do
    
    it 'should return status 200' do
      Movie.destroy_all

      post api_v1_movies_import_catalog_path

      expect(response).to have_http_status(200)
    end
    
    it 'should import movies' do
      Movie.destroy_all
      
      post api_v1_movies_import_catalog_path
      
      expect(Movie.count).to eq 131
      expect(JSON.parse(response.body)["message"]).to eq("Catalog imported successfully!")
    end

  end

  context 'list_catalog' do
    service = MovieService.new
    service.import

    it 'should return status 200' do
      get api_v1_movies_list_catalog_path

      expect(response).to have_http_status(200)
    end

    it 'should return status 200 using a filter' do
      get api_v1_movies_list_catalog_path(year: 2020)

      expect(response).to have_http_status(200)
      expect(response.body).to include '2020'
    end

    it 'should return status 200 using more than one filter' do
      get api_v1_movies_list_catalog_path(year: 2019, genre: 'TV Show', country: 'United States')

      expect(response).to have_http_status(200)
      expect(response.body).to include '2019'
      expect(response.body).to include 'TV Show'
      expect(response.body).to include 'United States'
    end
  
  end
end