Rails.application.routes.draw do
  get 'pages/index'
  root 'pages#index'
  
  get 'searches/show'
  
  get 'users/new'
  get 'users/new_manager'
  
  get 'sessions/new'
  
  get 'communities/new'
  
  get 'mains/index'
  
  get 'comments/new'
  
  get 'settings/new'
  
  get 'tests/test1'
  get 'tests/test2'
  
end
