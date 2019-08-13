class Sensor
    def new
    end

    def inspect
        ""
    end

    def initialize(name, key, email)
        @name = name
        @key = key
        @email = email
    end

    def getName
        return @name
    end

    def getKey
        return @key
    end
    
    def getEmail
        return @email
    end
end

