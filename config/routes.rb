Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'pages#home'
    resources :protests, only: %i[index show new create] do
      resources :protest_assaults, only: :create
      collection do
        get :today
      end
    end
  end
end
