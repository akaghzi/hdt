Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/help'
  get 'welcome/aboutus'
  get 'reports', to: "reports#index"

  resources :rentals do
    match 'complete', to:  "rentals#complete", via: :get
  end

  resources :task_contractors do
    get 'complete', to: "task_contractors#complete"
  end

  resources :products do 
    match 'lookup', to: "products#lookup", via: :get
  end

  resources :contractors

  resources :contacts
  resources :contact_reasons
  devise_for :users
  resources :stores
  
  resources :list_items do
    get 'putinbasket', to: "list_items#putinbasket"
    get 'takeoutofbasket', to: "list_items#takeoutofbasket"
    get 'complete', to: "list_items#complete"
  end
  resources :favorite_items do
    get 'copyitem', to: "favorite_items#copyitem"
  end
  match 'copyallitems', to: "favorite_items#copyallitems", via: :get

  resources :tasks do
    match 'complete', to: "tasks#complete", via: :get
  end

  resources :units

  resources :brands

  resources :item_categories

  resources :list_types
  
  get 'ndb/index'
  get 'ndb/oneoff'

end