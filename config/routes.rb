Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :perfumes

  
  root 'tweets#top'  
  get 'hello/index' => 'hello#index'
  # get 'tweets/:id' => 'tweets#show',as: 'tweet'

  # root 'hello#index'
 
  get    'tweets/top'      => 'tweets#top'
 
  
  resources :tweets do
  resources :likes, only: [:create, :destroy]
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
end