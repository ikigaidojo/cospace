Rails.application.routes.draw do

  get 'walk_ins/index'

  get "index/index"
  root to: "index#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/index", to: "index#index"

  devise_for :members, controllers: { registrations: "members/registrations" }

  resources :members, :only => [] do
    collection do
      get "check_your_email"
    end
  end

  resources :profiles, :only => [] do
    collection do
      get "index"
    end
  end

  get "calendars/calendar"

  resources :calendars, :only => [] do
    collection do
      get "calendar"
      get "show_spare"
    end
  end

  resources :invoices, :only => [:index] do
    collection do
      post "invoices"
      post "book_room"
      get  "create_pdf"
      post  "delete_booking"
    end
  end

  resource :setting, :only => [] do
    collection do
      patch "update_password"
      
    end
  end
  
  resources :settings, :only => [:index] do
    collection do
      patch "update_profile"
    end
  end  

  resources :admin_members, :only => [:index] do
  end
  
  resources :walk_ins, :only => [:index, :walkin_member] do
  end
end 






