require "#{Rails.root}/app/lib/led_control"
require 'rpi_gpio'

class SensorsController < ApplicationController
  include LedControl
  skip_before_action :verify_authenticity_token
  runLoop = false

  def temp
    setupLEDs
  end

  def turn_on
    RPi::GPIO.set_high params['led']
  end

  def turn_off    
    RPi::GPIO.set_low params['led']
  end

  def blink
  end

  def loop_leds
    runLoop = params['runLoop']
      
      # while runLoop
      #   RPi::GPIO.set_high 17
      #   sleep 1
      #   RPi::GPIO.set_low 17
      #   sleep 1
      # end
        
      if runLoop = false 
        RPi::GPIO.set_low 17
      end
  end

  def stop_loop
    runLoop = false
  end



  def setupLEDs
    RPi::GPIO.set_numbering :bcm  
    RPi::GPIO.setup 17, :as => :output
    RPi::GPIO.setup 25, :as => :output
    RPi::GPIO.setup 16, :as => :output
  end
end
