Rails.application.routes.draw do
  get "/auth/oauth2/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'chat#chat'
  resources :messages, only: [:create]
  get  'login' => "auth0#login"
  get  'logout' => "auth0#logout"
  mount ActionCable.server => 'cable'
end
