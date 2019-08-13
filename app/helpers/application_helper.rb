module ApplicationHelper
    def device_array
        counter = 0
        @sensArr = Arr.new

        Device.find_each do |device|
            tempname = device.name
            tempkey = device.sshkey
            tempuser = device.email

            if tempkey != "" && tempname != "" && tempuser != "" then
                d = Sensor.new(tempname, tempkey, tempuser); nil
                @sensArr.push(d)
                counter = counter + 1
            end
        end
        return @sensArr
    end

end
