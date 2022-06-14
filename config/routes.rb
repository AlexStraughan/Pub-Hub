Rails.application.routes.draw do
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

  # resources :stops, only: [:delete]
end
