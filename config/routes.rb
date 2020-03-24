Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  resources :articles, only: %i[show index]

  namespace :admin_scope do
    resources :articles, except: :destroy
  end

  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
