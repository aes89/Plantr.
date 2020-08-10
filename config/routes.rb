Rails.application.routes.draw do

  devise_for :users
  root 'page#home'
  resources :listings do
    resources :comments
  end
  
  post "listing/:listing_id/comment/:comment_id", to: "comments#create", as: "create_comment"

  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"


  get "/404", to: "errors#not_found"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'controller#index'
end
