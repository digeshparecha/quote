Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  resources :bids do
    resources :line_item_dates, except: [:index, :show] do 
      resources :line_items, except: [:index, :show]
    end
  end
  resources :users, only: [:update, :show, :edit]
end
