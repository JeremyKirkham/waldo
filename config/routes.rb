Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'chat#chat'
  post '/chat_text', to: 'chat#post_text'
  mount ActionCable.server => 'cable'
end
