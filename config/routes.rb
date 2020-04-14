Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  resource :message, only: %i[new create]

  resources :articles, only: %i[show index]
  resources :static_pages, only: :show

  namespace :admin_scope do
    resources :articles do
      resources :comments, except: %i[index new]
    end
    resources :static_pages
    resources :companies, except: %i[index destroy]
    resource :article_status, only: :update
  end

  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "articles#index"
end
