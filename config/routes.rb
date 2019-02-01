Rails.application.routes.draw do
  #get 'events/index'
  #get 'events/new'
  #get 'events/create'
	#get 'events/show'
	#get 'events/:id' => 'events#show'
	#post '/events' => 'events#create'
	
	devise_for :users
  resources :tickets
	#resources :users
	resources :events, :only => [:index, :new, :create, :show]
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	root :to => "public#index"
end
