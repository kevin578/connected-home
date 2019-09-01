Rails.application.routes.draw do
  get 'sensors/temp'
  match '/sensors/turn_on' => 'sensors#turn_on', via: :post
  match '/sensors/turn_off' => 'sensors#turn_off', via: :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
