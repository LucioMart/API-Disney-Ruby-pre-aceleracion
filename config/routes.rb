Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do 
  
    namespace 'v1' do 
    
      resource :users, only: [:create]
      post "/login", to: "user#login"
      get "/auto_login", to: "users#auto_login"
      resource :characters
      resource :movies
      resource :genders

    end

  end

end
