Rails.application.routes.draw do
  resources :artists

  resources :artist do 
    resources :songs, only: [:index, :show]
  end

  
  resources :songs
end
