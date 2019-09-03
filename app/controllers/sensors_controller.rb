require "#{Rails.root}/app/lib/led_control"
require 'rpi_gpio'

class SensorsController < ApplicationController
  @@thread = Thread.new {}
  @@pause_value = 0.5
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
    puts 'turning offzzz'    
    RPi::GPIO.set_low params['led']
  end

  def loop_leds
    @@thread.exit
    turn_LEDs_off
    runLoop = params['runLoop']
    
    if runLoop
      @@thread = Thread.new do
          loop do
            blink_led(17)
            blink_led(25)
            blink_led(16)
            end
      end
    end
  end

  def change_pause_value
    @@pause_value = params['pauseValue'].to_f
  end



  def setupLEDs
    RPi::GPIO.set_numbering :bcm  
    RPi::GPIO.setup 17, :as => :output
    RPi::GPIO.setup 25, :as => :output
    RPi::GPIO.setup 16, :as => :output
    turn_LEDs_off
  end

  def turn_LEDs_off
    RPi::GPIO.set_low 17
    RPi::GPIO.set_low 25
    RPi::GPIO.set_low 16
  end

  def blink_led(led) 
    RPi::GPIO.set_high led
    sleep @@pause_value
    RPi::GPIO.set_low led
  end


end
