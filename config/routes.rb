Rails.application.routes.draw do
  resources :portfolios
  devise_for :users
  root to: "home#index"
  get '/cadastre-se', to: "home#new_tenant", as: 'no_tenant_exists'
  
end
