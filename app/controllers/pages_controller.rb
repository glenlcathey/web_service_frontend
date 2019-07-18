class PagesController < ApplicationController
  include ActionController::UrlFor

  $generate

  def home
  end

  def generate_data

    #setup data generation based on what fields have been filled in the view
    if params[:url] == "" then
      params[:url] = "http://localhost:3000/sensors/"
    end

    if params[:generation_rate] == ""
      params[:generation_rate] = 3
    end

    #move passed parameters into an array

    #determine what fields have been left blank
    
      
    



    if $generate == true then
      return                         #ensures only one generation thread running at a time
    end

    $generate = true

    generate_data = Thread.new {

      require 'net/http'

      sensorTypes = ["flow_rate", "discharge_elevation", "discharge_pressure", "suction_pressure", "tank_fluid_surface_elevation", "tank_gas_overpressure", "motor_power"]

      while $generate do

        if params[:flow_rate_1] == "" then
          uri = URI(params[:url] + "flow_rate")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => 1)
          puts res
        else
          #temp_num = (params[:flow_rate_1].to_f + rand( ( params[:flow_rate_2] ).to_f - ( params[:flow_rate_1] ).to_f ))
          temp_num = rand(params[:flow_rate_1].to_f..params[:flow_rate_2].to_f)
          uri = URI(params[:url] + "flow_rate")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => 1)
          puts res
        end

        if params[:discharge_elevation_1] == "" then
          uri = URI(params[:url] + "discharge_elevation")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => 1)
          puts res
        else
          temp_num = rand(params[:discharge_elevation_1].to_f..params[:discharge_elevation_2].to_f)
          uri = URI(params[:url] + "discharge_elevation")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => 1)
          puts res
        end

        if params[:discharge_pressure_1] == "" then
          uri = URI(params[:url] + "discharge_pressure")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => 1)
          puts res
        else
          temp_num = rand(params[:discharge_pressure_1].to_f..params[:discharge_pressure_2].to_f)
          uri = URI(params[:url] + "discharge_pressure")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => 1)
          puts res
        end

        if params[:suction_pressure_1] == "" then
          uri = URI(params[:url] + "suction_pressure")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => 1)
          puts res
        else
          temp_num = rand(params[:suction_pressure_1].to_f..params[:suction_pressure_2].to_f)
          uri = URI(params[:url] + "suction_pressure")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => 1)
          puts res
        end

        if params[:tank_fluid_surface_elevation_1] == "" then
          uri = URI(params[:url] + "tank_fluid_surface_elevation")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => 1)
          puts res
        else
          temp_num = rand(params[:tank_fluid_surface_elevation_1].to_f..params[:tank_fluid_surface_elevation_2].to_f)
          uri = URI(params[:url] + "tank_fluid_surface_elevation")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => 1)
          puts res
        end

        if params[:tank_gas_overpressure_1] == "" then
          uri = URI(params[:url] + "tank_gas_overpressure")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => 1)
          puts res
        else
          temp_num = rand(params[:tank_gas_overpressure_1].to_f..params[:tank_gas_overpressure_2].to_f)
          uri = URI(params[:url] + "tank_gas_overpressure")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => 1)
          puts res
        end

        if params[:motor_power_1] == "" then
          uri = URI(params[:url] + "motor_power")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => 1)
          puts res
        else
          temp_num = rand(params[:motor_power_1].to_f..params[:motor_power_2].to_f)
          uri = URI(params[:url] + "motor_power")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => 1)
          puts res
        end

        puts ''

        sleep(params[:generation_rate].to_f)
      end
    }

  end

  def stop_generating_data
    $generate = false
  end

  #def delete_data
  #end

  

end
