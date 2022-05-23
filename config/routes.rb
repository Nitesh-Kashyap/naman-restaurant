Rails.application.routes.draw do
  resources :restaurants do 
    get 'add_dish'
    post 'dishes'
    match 'download', to: 'restaurants#show', via: [:get, :post]
    post 'review'
  end
  devise_for :users
  resources :dishes do
    get "add_review"
    post "review"
  end
  root 'restaurants#index'
end
