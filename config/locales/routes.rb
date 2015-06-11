Twitter_2::Application.routes.draw do
  resources :articles
  root to: "articles#index"
  match "auth/:provider/callback", to: 'sessions#'
end