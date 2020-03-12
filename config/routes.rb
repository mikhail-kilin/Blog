Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  resources :articles, except: :destroy do
    patch "publicate"
    patch "hide"
  end

  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "pages#home"
end
