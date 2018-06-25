Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get  '/following',    to: 'static_pages#global'
  get  '/new',    to: 'static_pages#newposts'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get  '/create',    to: 'static_pages#create'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :microposts do
      resources :comments
    member do
      get "like", to: "microposts#upvote"
      get "dislike", to: "microposts#downvote"
    end
  end

  resources :articles

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :relationships,       only: [:create, :destroy]

  resources :conversations do
      resources :messages
  end

end
