Rails.application.routes.draw do
  apipie
  mount Ckeditor::Engine => "/ckeditor"

  resources :companies, only: %i[index show] do
    resource :message, only: %i[new create]
  end

  namespace :v1 do
    defaults format: :json do
      resources :companies, only: :authors do
        get :authors, on: :member
      end

      resources :authors, only: :articles do
        get :articles, on: :member
      end

      resources :articles, only: :comments do
        get :comments, on: :member
      end
    end
  end

  resources :articles, only: :show do
    resources :comments, except: %i[index new]
    resources :ratings, only: %i[create update]
  end

  namespace :admin_scope do
    resources :articles
    resources :companies, except: %i[index destroy]
    resource :article_status, only: :update
    resources :company_registrations, only: :update
    resource :reports, only: :show do
      get :search, on: :collection
    end
  end

  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "companies#index"
end
