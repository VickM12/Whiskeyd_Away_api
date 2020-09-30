Rails.application.routes.draw do
  resources :ledgers
  root 'welcome#index'
  resources :whiskeys

  resources :users do                                                            
    collection do
      post '/login', to: 'users#login'  
      post '/users', to: 'users#create'                                          
    end                                                  
  end                                                                                
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
