Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/" => "posts#index"

  get "users" => "users#index"
  get "users/new" => "users#new"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"

  post "posts/:post_id/comments/create" => "comments#create"
  post "posts/:comment_id/comments/destroy" => "comments#destroy"

  post "posts/:post_id/likes/create" => "likes#create"
  post "posts/:post_id/likes/destroy" => "likes#destroy"

  post "users/:id/follows/create" => "follows#create"
  post "users/:id/follows/destroy" => "follows#destroy"

  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"

  get "login_form" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
end
