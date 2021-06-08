Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do 
    
      post '/login', to: 'auth#login'
      get '/auth', to: 'auth#persist'
      resources :characters
      resources :movies #Se accede a la ruta /api/v1/campeones
      
    
    end
  end

end
