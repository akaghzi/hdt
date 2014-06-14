Rails.application.routes.draw do


  root 'welcome#index'
  get 'welcome/help'
  get 'welcome/aboutus'
  get 'last30days', to: "last30days#index"

  resources :contacts
  resources :contact_reasons
  devise_for :users
  resources :stores
  resources :lists do
    get 'putinbasket', to: "lists#putinbasket"
    get 'takeoutofbasket', to: "lists#takeoutofbasket"
    get 'complete', to: "lists#complete"
  end

  resources :units

  resources :brands

  resources :items

  resources :item_categories

  resources :list_types

end
