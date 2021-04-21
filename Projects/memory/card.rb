# A Card has two useful bits of information: its face value, and whether 
# it is face-up or face-down. You'll want instance variables to 
# keep track of this information. You'll also want a method to 
# display information about the card: nothing when face-down, or 
# its value when face-up. I also wrote #hide, #reveal, #to_s, and #== methods.


class Card
    attr_reader :face_up
    attr_accessor :value

    def initialize
        @value = " "
        @face_up = false
    end

    def show_card
        @face_up = true
        @value
    end

    def hide_card
        @face_up = false
        print " "
    end

    def ==(card)
        self.value == card.value
    end

end