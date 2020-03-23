Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  resources :articles, only: :show

  namespace :admin_scope do
    resources :articles, except: :destroy do
      patch "publicate"
      patch "hide"
    end
  end

  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "pages#home"
end
