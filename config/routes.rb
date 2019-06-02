Rails.application.routes.draw do
  resources :favorates do 
    collection do 
      get 'toggle/:id'  , to: 'favorates#toggle'
    end
  end
  resources :movies
  root :to => "movies#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
