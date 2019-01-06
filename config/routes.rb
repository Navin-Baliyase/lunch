Rails.application.routes.draw do
	root :to => "employees#home"
	get "place" => "employees#user_place", :as => "place"
	get "logout" => "employees#destroy_login", :as => "logout"
    get "login" => "employees#verify_login", :as => "login"
	resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
