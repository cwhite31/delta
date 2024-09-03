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


end
