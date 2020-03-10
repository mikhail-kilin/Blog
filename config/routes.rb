Rails.application.routes.draw do
  resources :articles, except: :destroy
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
