Rails.application.routes.draw do

  devise_for :users
  namespace :admin do
      resources :courses
      resources :posts
      resources :professors
      resources :users

      root to: "courses#index"
    end
  resources :posts
  #resources :courses
  resources :professors
  # Root URL
  root 'courses#index'

  # After selecting the course
  get 'provas/:id' => 'admin/courses#show'
  # Routes to pages
  get 'contribute' => 'admin/posts#new'
  get 'about' => 'pages#about'
  get 'faq' => 'pages#faq'
  get 'user/:id' => 'pages#contribuicoes'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
