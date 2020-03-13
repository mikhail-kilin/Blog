Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  resources :articles, except: :destroy

  resource :message, only: %i[new create]

  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
