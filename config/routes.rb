DasWoerterbuch::Application.routes.draw do
  resources :users,   only: [:new, :create]
  resource  :session, only: [:new, :create, :destroy]

  get ":action" => "static#:action"
  root :to => "static#landingpage"
end