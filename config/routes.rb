Rails.application.routes.draw do
  resources :games, only: %i[show create update]
  put '/games/:game_id/positions/:id', to: 'games#update'
end
