Rails.application.routes.draw do
  root to: 'pages#home'
  resources :protest, only: %i[index show new create]
end
