require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each do |room_name, capacity|
        @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        @name.split(" ").map {|word| word.capitalize}.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        return true if @rooms.include?(name)
    false
    end

    def check_in(person, room1)
        if self.room_exists?(room1)
            if @rooms[room1].add_occupant(person)
                print "check in successful"
            else
                print "sorry, room is full"
            end
        else
            print "sorry, room does not exist"
        end
    end

    def has_vacancy?
    @rooms.values.any? { |room| !room.full? }
  end

  def list_rooms
    @rooms.each { |name, room| puts "#{name} : #{room.available_space}" }
  end

end
