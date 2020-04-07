Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  resource :message, only: %i[new create]

  resources :articles, only: %i[show index]
  resources :static_pages, only: :show

  namespace :admin_scope do
    resources :articles, except: :destroy
    resources :static_pages
    resource :article_status, only: :update
  end

  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "articles#index"
end
