Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
    get 'verify',on: :member
  end

  resources :blog

  root 'welcome#index'

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
