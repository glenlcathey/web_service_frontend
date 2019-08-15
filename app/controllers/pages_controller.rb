class PagesController < ApplicationController
  include ActionController::UrlFor

  before_action :authenticate_user!

  $generate
  $thread_array = []
  $boolean_array = []



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

    if $boolean_array[params[:id].to_i] == true then
      return                         #ensures only one generation thread running at a time
    end
    
    if params[:mimir_id] == ""
      params[:mimir_id] = params[:id]
    end

    $boolean_array[params[:id].to_i] = true

    $thread_array[params[:id].to_i] = Thread.new {

      require 'net/http'
      require 'date'

      sensorTypes = ["flow_rate", "discharge_elevation", "discharge_pressure", "suction_pressure", "tank_fluid_surface_elevation", "tank_gas_overpressure", "motor_power"]

      while $boolean_array[params[:id].to_i] do

        if params[:flow_rate_1] == "" then
          uri = URI(params[:url] + "flow_rate")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => params[:mimir_id])
          puts res
        else
          #temp_num = (params[:flow_rate_1].to_f + rand( ( params[:flow_rate_2] ).to_f - ( params[:flow_rate_1] ).to_f ))
          temp_num = rand(params[:flow_rate_1].to_f..params[:flow_rate_2].to_f)
          uri = URI(params[:url] + "flow_rate")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => params[:mimir_id])
          puts res
        end

        if params[:discharge_elevation_1] == "" then
          uri = URI(params[:url] + "discharge_elevation")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => params[:mimir_id])
          puts res
        else
          temp_num = rand(params[:discharge_elevation_1].to_f..params[:discharge_elevation_2].to_f)
          uri = URI(params[:url] + "discharge_elevation")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => params[:mimir_id])
          puts res
        end

        if params[:discharge_pressure_1] == "" then
          uri = URI(params[:url] + "discharge_pressure")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => params[:mimir_id])
          puts res
        else
          temp_num = rand(params[:discharge_pressure_1].to_f..params[:discharge_pressure_2].to_f)
          uri = URI(params[:url] + "discharge_pressure")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => params[:mimir_id])
          puts res
        end

        if params[:suction_pressure_1] == "" then
          uri = URI(params[:url] + "suction_pressure")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => params[:mimir_id])
          puts res
        else
          temp_num = rand(params[:suction_pressure_1].to_f..params[:suction_pressure_2].to_f)
          uri = URI(params[:url] + "suction_pressure")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => params[:mimir_id])
          puts res
        end

        if params[:tank_fluid_surface_elevation_1] == "" then
          uri = URI(params[:url] + "tank_fluid_surface_elevation")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => params[:mimir_id])
          puts res
        else
          temp_num = rand(params[:tank_fluid_surface_elevation_1].to_f..params[:tank_fluid_surface_elevation_2].to_f)
          uri = URI(params[:url] + "tank_fluid_surface_elevation")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => params[:mimir_id])
          puts res
        end

        if params[:tank_gas_overpressure_1] == "" then
          uri = URI(params[:url] + "tank_gas_overpressure")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => params[:mimir_id])
          puts res
        else
          temp_num = rand(params[:tank_gas_overpressure_1].to_f..params[:tank_gas_overpressure_2].to_f)
          uri = URI(params[:url] + "tank_gas_overpressure")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => params[:mimir_id])
          puts res
        end

        if params[:motor_power_1] == "" then
          uri = URI(params[:url] + "motor_power")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => (1.0 + rand(400)/100.0), 'id' => params[:mimir_id])
          puts res
        else
          temp_num = rand(params[:motor_power_1].to_f..params[:motor_power_2].to_f)
          uri = URI(params[:url] + "motor_power")
          res = Net::HTTP.post_form(uri, 'timestamp' => Time.now, 'sensorReading' => temp_num, 'id' => params[:mimir_id])
          puts res
        end

        puts ''

        sleep(params[:generation_rate].to_f)
      end
    }

  end

  def stop_generating_data
    $boolean_array[params[:id].to_i] = false
  end

  def delete_data
    require 'net/http'
    require 'date'

    if params[:url] == "" then
      params[:url] = "http://localhost:3000/sensors/"
    end
    
    sensorTypes = ["flow_rate", "discharge_elevation", "discharge_pressure", "suction_pressure", "tank_fluid_surface_elevation", "tank_gas_overpressure"]

    for type in sensorTypes do
      uri = URI(params[:url] + type)
      params = { :since => Date.today.prev_day, :id => 1}
      uri.query = URI.encode_www_form(params)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = false

      req = Net::HTTP::Delete.new(uri.path + "?" + uri.query)
      res = http.request(req)

      puts res
    end
  end

  def create_device
    require 'net/http'

    k = SSHKey.generate
    if params[:device_name] == "" then
      params[:device_name] = "default"
    end
    Device.create(:email => current_user.email, :sshkey => k.ssh_public_key, :name => params[:device_name])

    uri = URI('http://localhost:3000/user/device')
    res = Net::HTTP.post_form(uri, 'email' => current_user.email, 'sshkey' => k.ssh_public_key, 'name' => params[:device_name])
    puts res
  end

end
