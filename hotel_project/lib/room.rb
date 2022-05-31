class Room
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
      end
      
      attr_reader :capacity, :occupants
    
      def full?
        return true if @occupants.length == @capacity
        false
      end
    
      def available_space
        @capacity - @occupants.length
      end
    
      def add_occupant(name)
        return false if full?
        @occupants << name
        true
      end
end