class Hangman
    def initialize
        @mistakes = 0
    end

    def draw(mistakes)
        if mistakes == 1
            puts "  _______"
        elsif mistakes == 2
            i = 0
            while i < 6 do
                puts "   |"
                i += 1
            end
            puts " _________"
        elsif mistakes == 3
            puts "  _______"
            i = 0
            while i < 6 do
                puts "   |"
                i += 1
            end
            puts " _________"
        elsif mistakes == 4
            puts "  _______"
            puts "  |     |"
            puts "  |     0"
            puts "  |"
            puts "  |"
            puts "  |"
            puts "  |"
            puts " _________"
        elsif mistakes == 5
            puts "  _______"
            puts "  |     |"
            puts "  |     0"
            puts "  |    _|_"
            puts "  |     | "
            puts "  |"
            puts "  |"
            puts " _________"
        elsif mistakes == 6
            puts "  _______"
            puts "  |     |"
            puts "  |     0"
            puts "  |    _|_"
            puts "  |     | "
            puts "  |    / \\"
            puts "  |       "
            puts " _________"
        end
    end
end

hangman = Hangman.new
hangman.draw(3)
