Rails.application.routes.draw do
   root 'welcome#index'
   
   resources :ledgers do
      collection do
        get '/:id/whiskeys', to: 'users#show_whiskeys' 
      end
    end


 

  resources :whiskeys

  resources :users do                                                            
    collection do
      post '/login', to: 'users#login'  
      post '/users', to:  'users#create'
      get '/:id/whiskeys', to: 'users#show_whiskeys'
    end                                                  
  end                                                                                
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
