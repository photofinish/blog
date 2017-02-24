Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: "users/registrations"
  }
  get 'users/:user_id/atricles', to: 'atricles#index'
  resources :atricles do
    resources :histories
  end
  resources :photos
  root 'atricles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
