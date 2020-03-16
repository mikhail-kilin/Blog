Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  resources :articles, except: :destroy

  devise_for :users, skip: [:registrations]
  devise_scope :user do
    resource :users,
      only: %i[edit update],
      controller: "users/registrations",
      as: :user_registration
  end

  root to: "pages#home"
end
