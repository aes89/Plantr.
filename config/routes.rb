Rails.application.routes.draw do
  devise_for :users
  root 'page#home'
  resources :listings

  # get "/listing", to: "listings#index"
  # post "/listing", to: "listings#create"
  # get "/listing/new", to: "listings#new", as: "new_listing"
  # put "/listing/:id", to: "listings#update"
  # patch "/listing/:id", to: "listings#update"
  # delete "/listing/:id", to: "listings#destroy"
  # get "/listing/:id/edit", to: "listings#edit", as: "edit_listing"

  # get "*path", to:"page#not_found"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'controller#index'
end
