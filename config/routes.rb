Rails.application.routes.draw do
  devise_for :users, sign_out_via: %i[get post]

  get '/splash', to: 'groups#splash'

  root to: 'groups#splash'

  resources :groups, only: %i[index new create] do
    resources :entities, only: %i[index new create]
  end
end
