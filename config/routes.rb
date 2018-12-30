Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/" => "posts#index"

  get "users" => "users#index"
  get "users/new" => "users#new"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"

  post "posts/:id/comments/:post_id/create" => "comments#create"
  post "posts/:id/comments/:comment_id/destroy" => "comments#destroy"

  post "posts/:id/likes/:post_id/create" => "likes#create"
  post "posts/:id/likes/:post_id/destroy" => "likes#destroy"

  post "users/:id/follow/create" => "follows#create"
  post "users/:id/follow/destroy" => "follows#destroy"

  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"

  get "login_form" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
end
