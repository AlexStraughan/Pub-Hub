Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pubs do
    member do
      get :confirmation
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
  resources :pub_crawls, except: [:edit, :update] do
    resources :stops, only: :create
  end
  resources :stops, only: :destroy

  resources :users
  resources :reviews


  # resources :stops, only: [:delete]
end
