Rails.application.routes.draw do
  resources :friendships
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
end
