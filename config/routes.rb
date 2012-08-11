Pwa::Application.routes.draw do

  get "pages/show"
  root :to => "home#index"
  match "simple_search" => "home#simple_search", :as => :simple_search

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
                                       :registrations => "users/registrations",
                                       :sessions => "users/sessions"}
  namespace :admin do
    root :to => "pages#index"
    resources :auctions, :only => [:index, :show]
    resources :bids_list do
      collection do
        get "bids_list_csv"
      end
    end
    resources :pages
    resources :slider_items
    resources :banners
    resources :links

    resources :menu_entries
    resources :logos, only: [:index, :new, :create, :destroy]

    resources :users do
      collection do
        get "users_list_csv"
        get "show_highest_bidder"
      end
      resources :messages
      resources :bids do
        member do
          post 'mark_as_won'
          post 'mark_as_lost'
        end
      end
    end
  end
  resources :advanced_search do
    member do
      get "fix_on_side_menu"
    end
  end

  resources :auctions
  resources :watch_list, :only => [:index, :show, :destroy] do
    member do
      get "watch_auction"
    end
  end
  resources :bids
  resources :payments, only: [:new, :create] do
    collection do
      get "new_setup_fee_payment"
      post "create_setup_fee_payment"
    end
  end
  resources :account

  resources :pages, :only => [:show]
end
