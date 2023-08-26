Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"

  resources :users, except: [:create, :show]
  post :create_user, to: 'users#create'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create], defaults: { format: 'json'} do
        post :deactivate
      end
    end
  end
end
