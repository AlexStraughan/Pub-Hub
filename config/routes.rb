Rails.application.routes.draw do

  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'

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


  # resources :stops, only: [:delete]
end
