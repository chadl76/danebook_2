Rails.application.routes.draw do
	devise_scope :user do
		root 'devise/registrations#new'
	end
  devise_for :users
 	

 	resources :users, only: [:index]
 	resources :posts do 
 		resources :comments, only: [:new, :create, :update, :destroy]
 	end


 	get 'newsfeed/:id', to:'users#newsfeed',  as: :newsfeed
      	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
