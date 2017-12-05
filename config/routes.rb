Rails.application.routes.draw do
	root :to => "timelines#show"
  devise_for :users
 
		devise_scope :users do
		resources :users do 
  		  resource :timeline  do 
  	            end
            end
      	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end
