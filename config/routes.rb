Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :articles
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
end
