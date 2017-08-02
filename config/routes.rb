Rails.application.routes.draw do
  root to: "home#index"

  post "home/new_comment"

  get 'news/:en_name', to: 'articles#show', :as => :article
  get 'news', to: 'articles#index'

  resources :categories, :only => [:show]
  resources :articles, :only => [:index, :show]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  get ':en_name', to: 'categories#show'
end
