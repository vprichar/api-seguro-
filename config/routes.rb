require 'api_constraints'

Rails.application.routes.draw do

 

  devise_for :users
  resources :devices

  devise_for :admin_users, ActiveAdmin::Devise.config


  ActiveAdmin.routes(self)

  
 namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :customers
    end
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :insurances
    end
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :apikey
    end
     scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
     resources :fcmdevice
    end
    scope module: :v2, constraints: ApiConstraints.new(version: 2, default: false) do
      resources :customers
    end
     scope module: :v2, constraints: ApiConstraints.new(version: 2, default: false) do
      resources :insurances
    end
  end
 


 root 'customers#index'



  resources :insurances
  resources :apikey
  resources :f_insurance

#resources :campaigns
#resources :campaigns, :controller => "conta"





resources :customers do
    collection do
     get "fseguros", to: "customers#fseguros"
     get 'fseguros'
    end
  end



  resources :campaigns do
    collection do

     get "conta", to: "campaigns#conta"
     get "getgrafica", to: "campaigns#getgrafica"
     get 'getmensa'
     
    end
  end


 

end
