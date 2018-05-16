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

  get 'calendars/calendar'

end
