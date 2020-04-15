Rails.application.routes.draw do
  get 'pages/index'
  root 'pages#index'
  
  get 'searches/show', to: 'searches#show'
  
  get 'users/new_manager'
  
  resources :users
  resources :account_activations, only: [:edit]
  
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  #get 'communities/new'
  resources :communities
  # params[:id] <== 有効化トークン入れる
  # Controller: params[:id]
  
  resources :invitations
  
  get 'mains/index'
  
  get 'comments/new'
  
  get 'settings/new'
  
  get 'schedules/calender'
  
  get 'tests/test1'
  get 'tests/test2'
  get 'tests/test3'
  
end
