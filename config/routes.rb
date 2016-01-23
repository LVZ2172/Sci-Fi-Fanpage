Rails.application.routes.draw do
  root 'movies#index'

  resources :movies do
    resources :reviews, :except => [:show, :index, :edit]
  end
end
