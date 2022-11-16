Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get]
  resources :groups, only: %i[index new create] do
    resources :entities, only: %i[index new create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'groups#index'
end
