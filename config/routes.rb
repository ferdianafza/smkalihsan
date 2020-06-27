Rails.application.routes.draw do
  resources :blogs
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :homes
  resources :artikels
  get 'teacher/index'
  get 'homes/index'
  get "/teacher/index" => "teacher/index"
  root to: 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
