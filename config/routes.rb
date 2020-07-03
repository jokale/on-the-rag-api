Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show, :index]
  resources :notes
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  post 'user_token' => 'user_token#create'
  post 'find_user' => 'users#find'
  resources :users do
    resources :notes
  end
end
