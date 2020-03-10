Rails.application.routes.draw do
  mount Redactor2Rails::Engine => "/redactor2_rails"
  resources :articles, except: :destroy
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
