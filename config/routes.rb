Rails.application.routes.draw do
  
  devise_for :chefs, controllers: { registrations: "chefs/registrations" }

  root "pages#home"
  get  "pages/home", to: "pages#home"

  resources :recipes do
    resources :comments, only: [:create] #nested route

    member do
      post 'like'
    end
  end

  resources :chefs, only: [:index, :show]
  resources :ingredients, except: [:destroy]

  mount ActionCable.server => '/cable'

  get '/chat', to: 'chatrooms#show'

  resources :messages, only: [:create]

  get 'search_stocks', to: 'stocks#search'
end
