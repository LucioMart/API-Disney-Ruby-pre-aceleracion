Rails.application.routes.draw do
  get 'auth/login'
  get 'auth/persist'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
