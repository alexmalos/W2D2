require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = rooms.map { |k, v| [k, Room.new(v)] }.to_h
  end

  def name
    @name.split.map { |word| word[0].upcase + word[1..-1] }.join(" ")
  end
  
  attr_reader :rooms

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person, room_name)
    if room_exists?(room_name)
        if @rooms[room_name].add_occupant(person)
            puts 'check in successful'
        else
            puts 'sorry, room is full'
        end
    else
        puts 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    !@rooms.all? { |room_name, room| room.full? }
  end

  def list_rooms
    @rooms.each { |room_name, room| puts room_name + ": " + room.available_space.to_s }
  end
end
