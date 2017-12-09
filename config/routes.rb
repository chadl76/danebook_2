Rails.application.routes.draw do
	root :to => "timelines#show"
  devise_for :users
 
		devise_scope :users do
		resources :users do 
		  resource :profile
  		  resource :timeline  do
  		  	resources :posts do 
  		  		resources :comments
  		  	      end
  	            end
            end
      	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end
