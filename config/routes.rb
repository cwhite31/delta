Rails.application.routes.draw do
  
  # Defines the root path route ("/")
  root "welcome#index"
  resources :contacts do
    collection do
      post "load"
    end
  end
  resources :countries


end
