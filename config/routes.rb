Rails.application.routes.draw do
  # only enable /locations for now
  resources :locations, only: [:index]

  root 'locations#index'
end
