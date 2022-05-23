Rails.application.routes.draw do
  resources :restaurants do 
    get 'add_dish'
    post 'dishes'
    post 'review'
  end
  devise_for :users
  resources :dishes do
    get "add_review"
    post "review"
  end
  root 'restaurants#index'
end
