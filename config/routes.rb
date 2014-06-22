Rails.application.routes.draw do


  resources :task_vendors

  resources :vendors

  root 'welcome#index'
  get 'welcome/help'
  get 'welcome/aboutus'
  get 'last30days', to: "last30days#index"

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

  resources :tasks

  resources :units

  resources :brands

  resources :items

  resources :item_categories

  resources :list_types

end
