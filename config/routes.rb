DasWoerterbuch::Application.routes.draw do
  resources :users,   only: [:new, :create]
  resource  :session, only: [:new, :create, :destroy]

  namespace :my do
    resources :words

    root to: "words#index"
  end

  get ":action" => "static#:action"
  root to: "static#landingpage"

  scope '/styleguide' do
    get ":action" => "styleguides#:action"
  end

end