Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  resources :articles, only: :show
  resources :static_pages, only: :show

  namespace :admin_scope do
    resources :articles, except: :destroy
    resources :static_pages
  end

  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
