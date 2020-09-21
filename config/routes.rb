Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'pages#home'
    get '/about', to: 'pages#about'
    resources :protests, only: %i[index show new create] do
      resources :protest_assaults, only: :create
    end
  end
end
