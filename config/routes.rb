Rails.application.routes.draw do
  get 'employees_profiles/show'
  resources :joboffers, only: [:index, :show, :create, :new] do
    member do
      get 'apply'
    end
  end

    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

    devise_scope :user do
      get "/users/sign_out" => "devise/sessions#destroy", as: :logoutrails
    end



    resources :application, only: [:index]

    get '/employees_profiles/:id', to: 'employees_profiles#show', as: 'employee_profile'

    resource :profile, only: [:edit, :update]




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
    root "welcome#index"
end
