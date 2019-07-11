class PagesController < ApplicationController
  include ActionController::UrlFor

  $generate

  def home
  end

  def generate_data

    if $generate == true then
      return
    end

    $generate = true

    generate_data = Thread.new {

      require 'net/http'

      r = Random.new
      sensorTypes = ["flow_rate", "discharge_elevation", "discharge_pressure", "suction_pressure", "tank_fluid_surface_elevation", "tank_gas_overpressure", "motor_power"]

      while $generate do
        for type in sensorTypes do
          uri = URI("http://localhost:3000/sensors/" + type)
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => 1)
          puts res
        end
        puts ''

        sleep(5)
      end
    }

  end

  def stop_generating_data
    $generate = false
  end

  

end
