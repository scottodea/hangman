require 'faker'
require 'colorize'
require_relative 'hangman'

###  NOTES Talk with Gino -- Do we get rid of spaces in answer?
###                          Do we remove punctuation from answer?
###                          Some People include numbers (ex. Android 20) - delete line 97?
###                          Explain check_guess logic
###                          Only works for one runthrough
###                          Need to implement classes further
###                          Need to show wrong letters
###                          Fix harry potter

## To Fix
# - handling entering a letter multiple times
# - listing previous wrong guesses 
# - you lose message
# - exit the game when player loses/wins

class Game
    def initialize
        @mistakes = 0
        @answer = []
        @progress_array = []
        @progress_string = ""
        start_game
        welcome
        category
        word
        @guess = ''
        guess
    end

    def start_game
        puts '  _______'.colorize(:red)
        puts' /   |   \_____    ____    ____   _____ _____    ____  '.colorize(:red)
        puts'/    ~    \__  \  /    \  / ___\ /     \ __  \  /    \ '.colorize(:red)
        puts'\    Y    // __ \|   |  \/ /_/  >  Y Y  \/ __ \|   |  \ '.colorize(:red)
        puts' \___|_  /(____  /___|  /\___  /|__|_|  (____  /___|  /'.colorize(:red)
        puts'       \/      \/     \//_____/       \/     \/     \/'.colorize(:red)
        puts"Ready to play? Y/N"
        response = gets.chomp.downcase
        if response == "n"
            puts "FINE!"
            sleep(2)
            abort
        elsif
          response == "y"
          system('clear')
        else 
        puts "I said to put Y or N!"
        sleep(1)
        abort
        end
    end

    def welcome
        puts "Hey, What's Hangin?"
        puts "Name please: "
        @name = gets.chomp
        @name.capitalize!
        system('clear')
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
        @answer.chars
    end
    
    def word
        @hidden_word = @answer.chars.count
        @hidden_word = "_ " * @hidden_word.to_i
        # system('clear')-- implement later for cleaner app
        puts @hidden_word
    end
    # while @lives > 0
    def guess
        hangman = Hangman.new
        while @mistakes < 6 do 
            puts "Please enter a letter guess: "
            loop do
                @guess = gets.chomp.upcase!
                if @guess.chars.count > 1
                    puts "Only one character please!"
                #↓↓↓↓FIX_ME guess.to_i > 0 only works if they don't input 0. Using for now better solution
                elsif @guess.to_i > 0
                    puts "Only letters please!"
                else 
                    #↓↓↓↓ takes us out of loop
                    break
                end
            end
            # check guess
            if @answer.chars.include?(@guess)
                puts "You got a letter!"
                puts
                #↓↓↓ turns answer into @array
                # check if progress has been made
                @array = @answer.chars
                #↓↓↓ checks each element of @array, if guess matches element it remains, otherwise replaced with _
                @array = @array.map do |element|
                if element == @guess
                    "#{@guess}"
                else
                    "_"
                end
            end    
                ###### if progress_array contains a partial answer, update progress_array with new correct guesses 
            if @progress_array.length == 0
               @progress_array = @array                    
            else
               # update array with new correct guess
                guess_array = @array.each_index.select { |index| @array[index] == @guess}
                guess_array.each do |index|
                    @progress_array.delete_at(index)
                    @progress_array.insert(index, @guess)
                    end
            end
            @array = @array.map do |x|
                 "#{x} "
                 end
            @progress_string = @progress_array.join(",").delete(",")    
            i = 0
            while i < @progress_string.length do
                print "#{@progress_string[i]} "
                i += 1                
            end
            puts
            else
            puts "Uh-oh, hangman just got one stage closer:"
            @mistakes += 1
            #draw Hangman
            hangman.draw(@mistakes)
            print @progress_array
        end
        if @progress_array.include?("_") == false
            puts "you win"
            break
        end
    end
end
end

user = Game.new
