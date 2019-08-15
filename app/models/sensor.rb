class Sensor
    def new
    end

    def inspect
        ""
    end

    def initialize(name, key, email, id)
        @name = name
        @key = key
        @email = email
        @id = id
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

    def getId
        return @id
    end
end

