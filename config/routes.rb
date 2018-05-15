Rails.application.routes.draw do
  
  get 'index/index'
  root to: 'index#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/index', to: 'index#index'

  devise_for :members, controllers: { registrations: 'member/registrations' }

end
