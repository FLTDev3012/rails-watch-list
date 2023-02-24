Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "lists#index"
  # get "lists", to: "lists#index"
  # get "lists/new", to: "lists#new", as: :new_list
  # post "lists", to: "lists#create"
  # get "lists/:id", to: "lists#show", as: :list
  # get "lists/:id/edit", to: "lists#edit", as: :edit_list
  # patch "lists/:id", to: "lists#update"
  # delete "lists/:id", to: "lists#destroy"

  # get "movies", to: "movies#index"
  # get "movies/:id", to: "movies#show", as: :movie
  root "lists#index"


  resources :lists do
    resources :movies, only: [:index, :show] do
      resources :bookmarks, only: [:create]
    end
  end

  resources :movies, only: :destroy do
    collection do
      get :top
    end
  end
end
