Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/movies/import_catalog', action: :import_catalog, controller: 'movies'
      get '/movies/list_catalog', action: :list_catalog, controller: 'movies'
    end
  end
end
