Rails.application.routes.draw do
  
  resources :categories do 
    resources :recipes 
  end
  
  root to: 'home#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  
  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy'
  end
  
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end 
      

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
