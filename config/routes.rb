Rails.application.routes.draw do
  resources :games, only: %i[show create update]
end
