# Word class handles the generation of a random word using the faker gem
# formats the word to remove any unwanted punctuation and symbols

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
        # while loop to ensure that user enters the right input
        # generate random word using faker
        while @answer = gets.chomp
            case @answer.strip
            when "1"
                @answer = Faker::StarWars.character
                system('afplay starwars.wav')
                break
            when "2"
                @answer = Faker::Pokemon.name
                system('afplay pokemon.wav')
                break
            when "3"
                @answer = Faker::DragonBall.character
                system('afplay dragonball.wav')
                break
            when "4"
                @answer = Faker::HarryPotter.character
                system('afplay harrypotter.wav')
                break
            when "5"
                @answer = Faker::Simpsons.character
                system('afplay simpsons.wav')
                break
            else
                puts "Please enter a number from 1 to 5"
            end
        end       
        system('clear')
        # check if @answer contains non-alphanumeric characters
        trim_array = []
        @answer.chars.each do |char|
            if !char.match(/\A[a-zA-Z0-9 ]*\z/)
                char = ''
                trim_array.push(char)
            else
                trim_array.push(char)
            end
        end
        @answer = trim_array.join
        @answer.upcase!
    end

    # convert the random word into a "hidden word" that replaces character swith underscores
    def show_hidden_word
        hidden_word = @answer.chars
        hidden_word = hidden_word.map do |element|
            if element.match(/\A[a-zA-Z0-9]*\z/) 
                "_ "
            elsif element == " "
                "  "
            else
                ''
            end    
        end
        hidden_word = hidden_word.join
        print hidden_word
        return hidden_word
    end
end