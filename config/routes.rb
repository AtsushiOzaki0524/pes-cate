Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  
  root 'topics#index'
  
  resources :users
  
  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :topics
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  get '/comments/:topic_id/new' => 'comments#new', as: 'comments'
  post '/comments/:topic_id/create', to: 'comments#create', as:'comments_create'
  get '/comments/:id/edit', to: 'comments#edit', as:'edit_comments'
  patch '/comments/:id', to: 'comments#update', as: 'comments_update'
  delete '/comments', to: 'comments#destroy', as:'comment_delete'
end
