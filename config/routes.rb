Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'pages#home'
    get '/about', to: 'pages#about'
    get '/support', to: 'pages#support'
    resources :protests, only: %i[index show new create] do
      resources :protest_assaults, only: :create
    end
  end
end
