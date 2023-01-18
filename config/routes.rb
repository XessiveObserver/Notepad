Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
  
  resources :notes
  
  root "static_pages#index"    
end
