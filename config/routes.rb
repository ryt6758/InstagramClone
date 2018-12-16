Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/" => "posts#index"

  get "users/new" => "users#new"

  get "posts/new" => "posts#new"

end
