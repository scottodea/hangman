require 'faker'

class Word
    def initialize
        @answer = ""
    end

    def pick_category(name)
        puts "Hey #{name}! Welcome to hangman!"
        puts "Pick a category:"
        puts "1. Starwars"
        puts "2. Pokemon"
        puts "3. Dragonball"            
        puts "4. Harry Potter"
        puts "5. Simpsons"
        @answer = gets.chomp
        case
        when @answer == "1"
        @answer = Faker::StarWars.character
        when @answer == "2"
        @answer = Faker::Pokemon.name
        when @answer == "3"
        @answer = Faker::DragonBall.character
        when @answer == "4"
        @answer == Faker::HarryPotter.character
        when @answer == "5"
        @answer = Faker::Simpsons.character
        end
        puts @answer
        @answer.upcase!
        #↓↓↓↓↓↓ We will remove the line below when finished -- Just to help see answer while working
    end

    def show_hidden_word
        hidden_word = @answer.chars.count
        hidden_word = "_ " * hidden_word.to_i
        # system('clear')-- implement later for cleaner app
        puts hidden_word
    end
end

# word = Word.new
# word.pick_category("Gino")
# word.show_hidden_word
# word.guess