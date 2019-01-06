Rails.application.routes.draw do
	root :to => "employees#home"
	get "place" => "employees#user_place", :as => "place"
	get "logout" => "employees#destroy_login", :as => "logout"
    get "login" => "employees#verify_login", :as => "login"
    get "reset/*value" => "employees#reset_password", :as => "reset"
    get "reset/*value" => "employees#update_password", :as => "update"
    post "finalize" => "employees#finalize", :as => "finalize"
	resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
