class AuthConstraint
  def matches?(request)
    request.cookies['remember_token'].present?
  end
end

Yourchallenger::Application.routes.draw do

  root to: 'users#index', constraints: AuthConstraint.new, as: nil
  root to: 'main#home', as: nil

  resources :users, only: [:create, :update]
  resources :sessions, only: [:create, :destroy]
  get '/signup', to: 'users#new', as: :signup
  get '/signin', to: 'sessions#new', as: :login

  delete '/signout', to: 'sessions#destroy', as: :logout

  get ':username', to: 'users#show', as: :user_home

  #product route like settings/account
  namespace :settings do
    get 'account', to: 'accounts#account'
    get 'password', to: 'accounts#password'
    get 'profile', to: 'accounts#profile'

    post 'update_account', to: 'accounts#update_account'
    post 'update_password', to: 'accounts#update_password'
    post 'update_profile', to: 'accounts#update_profile'
  end

end
