Rails.application.routes.draw do
   root 'welcome#index'
   
   resources :ledgers do
      collection do
        get '/ledgers/users/:id', to: 'ledgers#user_show' 
      end
    end


 

  resources :whiskeys

  resources :users do                                                            
    collection do
      post '/login', to: 'users#login'  
      post '/users', to: 'users#create'                                          
    end                                                  
  end                                                                                
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
