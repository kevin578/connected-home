Rails.application.routes.draw do
  get 'sensors/temp'
  match '/sensors/turn_on' => 'sensors#turn_on', via: :post
  match '/sensors/turn_off' => 'sensors#turn_off', via: :post
  match '/sensors/loopleds' => 'sensors#loop_leds', via: :post
  match '/sensors/stoploop' => 'sensors#stop_loop', via: :post
  match '/sensors/changepausevalue' => 'sensors#change_pause_value', via: :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
