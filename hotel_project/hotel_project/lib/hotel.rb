require_relative "room"

class Hotel
    def initialize(name, room_names)
        @name=name
        @rooms ={}
        room_names.each do |k,v|
            @rooms[k] = Room.new(v)
        end
    end
    def name
        return @name.split(' ').map(&:capitalize).join(" ")
    end
    def rooms
        @rooms
    end
    def room_exists?(room_name)
        if @rooms.keys.include?(room_name)
            return true
        else
            return false
        end
    end
    def check_in(person, room_name)
        if room_exists?(room_name)
            @rooms[room_name].add_occupant(person)
            if @rooms[room_name].add_occupant(person)
                print 'check in successful'
            end
        else
            print 'sorry, room does not exist'
        end
    end
end
