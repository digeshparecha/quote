Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get "export_csv", to: "pages#export_csv"
  resources :bids do
    resources :line_item_dates, except: [:index, :show] do 
      resources :line_items, except: [:index, :show]
    end
  end
  resources :users, only: [:update, :show, :edit]
end
