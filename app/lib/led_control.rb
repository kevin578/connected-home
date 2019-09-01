module LedControl
    require 'rpi_gpio'
    def blink
        RPi::GPIO.set_numbering :bcm   
        RPi::GPIO.setup 17, :as => :output
        RPi::GPIO.set_high 17
    end


    def saySomething
        puts "look here !!!!$"
    end

end