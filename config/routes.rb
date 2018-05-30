Rails.application.routes.draw do

  get 'index/index'
  root to: 'index#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/index', to: 'index#index'

  devise_for :members, controllers: { registrations: 'members/registrations' }

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

  get 'calendars/calendar'

  get 'invoices/admin_index'
  get 'invoices/index'
  #get 'profiles/index'

  resources :calendars, :only => [] do
    collection do
      get "calendar"
      get "show_spare"
    end
  end

  resources :invoices, :only => [] do
    collection do
      post "invoices"
      post "book_room"
    end
  end

  resource :setting, :only => [] do
    collection do
      patch 'update_password'
    end  
  end  

  resources :settings, :only => [:index] do
  end  
  
 end 






