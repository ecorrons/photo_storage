Rails.application.routes.draw do
  resources :images, only: :index

  get '/search/:searchTerm', to: 'images#search'
end
