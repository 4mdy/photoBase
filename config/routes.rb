Rails.application.routes.draw do 
  root 'pages#home'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  devise_for :users

  resources :likes, only: %i(create destroy)
  resources :comments, only: %i(create)

  resources :posts, only: %i(new create index) do
    resources :photos, only: %i(create)
    resources :likes
  end
 
  get '/users/:id', to: 'users#show', as: 'user'
end
