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

  #get ':name', to: 'users#show', as: :user_home

  #product route like settings/account
  namespace :settings do
    resources :accounts, only: [:create, :update]
    get 'account', to: 'accounts#new', as: :settings_account
  end

end
