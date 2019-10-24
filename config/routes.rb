Rails.application.routes.draw do
	root 'reports#index'
	resources :users do
		resources :bookings do
			resources :tickets
		end
	end
	resources :bookings do
		resources :tickets
	end
	resources :routes do
			resources :reservations
	end	

  get "/reports" => 'reports#index'
  match "/reports/search" => "reports#search", as: :search_report, via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
