Rails.application.routes.draw do
  devise_for :users
  resources :tasks do
    resources :activities
  end
  resources :reviewers
  resources :messages
  root 'tasks#index'
  resources :rooms 
end
