Rails.application.routes.draw do
  
  get 'public/organization'
  get 'sessions/new'
  get 'sessions/destroy'
  resources :mails do
  	resources :mail_histories
  end
  resources :status_deliveries
  resources :staffs
  resources :issues
  resources :positions
  resources :departments
  resources :sessions

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'mails#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
