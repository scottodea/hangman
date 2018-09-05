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
        while @answer = gets.chomp
            case @answer.strip
            when "1"
                @answer = Faker::StarWars.character
                break
            when "2"
                @answer = Faker::Pokemon.name
                break
            when "3"
                @answer = Faker::DragonBall.character
                break
            when "4"
                @answer = Faker::HarryPotter.character
                break
            when "5"
                @answer = Faker::Simpsons.character
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
                #delete char
                char = ''
                trim_array.push(char)
            else
                trim_array.push(char)
            end
        end
        @answer = trim_array.join
        # puts @answer
        @answer.upcase!
    end

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