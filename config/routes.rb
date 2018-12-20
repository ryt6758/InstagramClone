Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/" => "posts#index"

  get "users" => "users#index"
  get "users/new" => "users#new"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"

  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  post "posts/:id/comment" => "comments#write"

  get "login_form" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"



end
