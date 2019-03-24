Rails.application.routes.draw do

  #get 'show/:id', to: 'comments#show'
  resources :comments
  resources :articles do
  get 'comments/new' => "comment#new"
  end 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
