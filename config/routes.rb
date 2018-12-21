Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/" => "posts#index"

  get "users" => "users#index"
  get "users/new" => "users#new"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"

  get "posts/:id" => "posts#show"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"

  post "comments/:id/create" => "comments#create"
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  get "login_form" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"


end
