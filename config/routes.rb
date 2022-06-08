Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pubs
  # Defines the root path route ("/")
  # root "articles#index"
  get '/search' => 'search#index'
  resources :pub_crawls do
    resources :stops, only: [:new, :create]
  end

  # resources :stops, only: [:delete]
end
