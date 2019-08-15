module ApplicationHelper
    def device_array
        counter = 0
        @sensArr = Arr.new

        Device.find_each do |device|
            tempname = device.name
            tempkey = device.sshkey
            tempuser = device.email
            tempid = device.id

            if tempkey != "" && tempname != "" && tempuser != "" then
                d = Sensor.new(tempname, tempkey, tempuser, tempid); nil
                @sensArr.push(d)
                counter = counter + 1
            end
        end
        return @sensArr
    end

    def find_device(id)
        d = Device.find(id)
        t = Sensor.new(d.name, d.sshkey, d.email, d.id)
        return t
    end
    

end
