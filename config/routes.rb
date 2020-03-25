Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  resource :message, only: %i[new create]

  resources :articles, only: %i[show index]
  resources :static_pages, only: :show

  namespace :admin_scope do
    resources :articles, except: :destroy
    resources :static_pages
  end

  devise_for :users, skip: [:registrations]
  devise_scope :user do
    resource :users,
      only: %i[edit update],
      controller: "users/registrations",
      as: :user_registration
  end

  root to: "pages#home"
end
