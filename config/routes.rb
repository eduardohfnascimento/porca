Rails.application.routes.draw do

  namespace :admin do
      resources :courses
      resources :posts
      resources :professors

      root to: "courses#index"
    end
  resources :posts
  resources :courses
  resources :professors
  # Root URL
  root 'pages#index'

  # Routes to pages
  get 'contribute' => 'pages#contribute'
  get 'about' => 'pages#about'
  get 'faq' => 'pages#faq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
