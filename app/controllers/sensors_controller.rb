require "#{Rails.root}/app/lib/led_control"
require 'rpi_gpio'

class SensorsController < ApplicationController
  include LedControl
  skip_before_action :verify_authenticity_token

  def temp
    RPi::GPIO.set_numbering :bcm   
    RPi::GPIO.setup 17, :as => :output
    RPi::GPIO.set_low 17
  end

  def turn_on
    RPi::GPIO.set_numbering :bcm   
    RPi::GPIO.setup 17, :as => :output
    RPi::GPIO.set_high 17
  end

  def turn_off
    RPi::GPIO.set_numbering :bcm   
    RPi::GPIO.setup 17, :as => :output
    RPi::GPIO.set_low 17
  end
end
