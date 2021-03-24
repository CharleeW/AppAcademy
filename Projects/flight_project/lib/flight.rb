require "passenger"

class Flight

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        if @passengers.length >= @capacity
            return true
        else
            return false
        end
    end

    def board_passenger(passenger)
        if !(full?)
            if passenger.has_flight?(@flight_number)
                @passengers << passenger
            end
        end
    end

    def list_passengers
        arra = []
        @passengers.each do |ele|
            arra << ele.name
        end
        arra
    end

    def [](i)
        @passengers[i]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end

end