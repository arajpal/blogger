Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get 'welcome/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
    get 'verify',on: :member
  end

  resources :blog

  root 'welcome#index'
end
