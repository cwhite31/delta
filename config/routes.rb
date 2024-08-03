Rails.application.routes.draw do
  resources :contacts
  # Defines the root path route ("/")
  root "welcome#index"
end
