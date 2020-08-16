Rails.application.routes.draw do
  # devise gem handles user accounts, authentication and sesions. 
  devise_for :users
  
  root "listings#home"
  get "listings/transactions", to: "listings#transactions"
  get "listings/user_listings", to: "listings#user_listings"
  patch "/listings/whatever/:id", to: "listings#buy", as: "buy_listing"
  
  resources :listings do
    resources :comments
  end 

  #routes for stripe payments and returning webhook
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"

  #future featre - errors/missing pages handled with exception_handler gem: https://github.com/richpeck/exception_handler
  # get "/404", to: "errors#not_found"

end
