Rails.application.routes.draw do
  get '/led', to: 'led#index'
  get '/temperature', to: 'temperature#index'
  get '/apostrophe', to: 'apostrophe#index'
  match '/led/turn_on' => 'led#turn_on', via: :post
  match '/led/turn_off' => 'led#turn_off', via: :post
  match '/led/loopleds' => 'led#loop_leds', via: :post
  match '/led/stoploop' => 'led#stop_loop', via: :post
  match '/led/changepausevalue' => 'led#change_pause_value', via: :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
