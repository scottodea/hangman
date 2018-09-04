require 'faker'

class Word(category)
    def initialize
        @category = category
    end

    def category
        puts "Hey #{@name}! Welcome to hangman!"
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
        @answer.upcase!
        #↓↓↓↓↓↓ We will remove the line below when finished -- Just to help see answer while working
        puts @answer
    end
    
    def word
        @hidden_word = @answer.chars.count
        @hidden_word = "_ " * @hidden_word.to_i
        # system('clear')-- implement later for cleaner app
        puts @hidden_word
    end
    # while @lives > 0
    def guess
        puts "Please enter a letter guess: "
        loop do
            @guess = gets.chomp.upcase!
            if @guess.chars.count > 1
                puts "Only one character please!"
            #↓↓↓↓FIX_ME guess.to_i > 0 only works if they don't input 0. Using for now until better solution
            elsif @guess.to_i > 0
                puts "Only letters please!"
            else 
                #↓↓↓↓ takes us out of loop
                break
            end
        end
    end
end