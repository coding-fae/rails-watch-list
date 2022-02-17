Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:create, :show, :index, :new] do
    resources :lists, only: [:create, :new, :show, :index]
    resources :bookmarks, only: [:create, :new, :show, :delete]
  end
end
