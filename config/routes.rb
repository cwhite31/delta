Rails.application.routes.draw do
  devise_for :users
  
  # Defines the root path route ("/")
  root "welcome#index"
  resources :contacts do
    collection do
      post "load"
    end
  end
  resources :countries
  resources :reports do
    collection do
      get "us_states"
    end
  end


end
