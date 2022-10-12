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
            if @rooms[room_name].add_occupant(person) #this is both a mutation AND returning boolean
                print 'check in successful'
            else 
                print 'sorry, room is full'
            end
        else
            print 'sorry, room does not exist'
        end
    end
    def has_vacancy?
        @rooms.each do |k,v|
            return true if !v.full? #returns true if a single room in @rooms is not full
        end
        return false
    end
    def list_rooms
        @rooms.each do |k,v|
            puts "#{k} : #{v.available_space}"
        end
    end
end
