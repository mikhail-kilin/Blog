Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  resources :articles, except: :destroy
  resources :static_pages
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
