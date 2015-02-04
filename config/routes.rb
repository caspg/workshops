Rails.application.routes.draw do
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  devise_for :users, controllers: { registrations: 'registrations' }, skip: :sessions
  as :user do
    get    "/login"  => "devise/sessions#new",     :as => :new_user_session
    post   "/login"  => "devise/sessions#create",  :as => :user_session
    get    "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
  end

  root 'categories#index'
end
