Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pubs do
    resources :stops, only: [:new, :create]
    member do
      get :confirmation
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
  resources :pub_crawls, except: [:edit, :update]

  # resources :stops, only: :destroy

  resources :users
  resources :reviews

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  # resources :stops, only: [:delete]
end
