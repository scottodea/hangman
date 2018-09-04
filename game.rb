require 'colorize'
require_relative 'hangman'
require_relative 'word'

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
    attr_accessor :name, :answer

    def initialize
        @mistakes = 0
        @answer = []
        @progress_array = []
        @progress_string = ""
        @name = ""
        @guess = ''
        @wrong_letters = []
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
            if @wrong_letters == []

            else print "Letters used #{@wrong_letters}"
                puts
            end
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
                @wrong_letters << @guess
            end

            if @progress_array.include?("_") == false and @progress_array != []
                puts "you win"
                break
            end
        end
    end
end

new_game = Game.new
word = Word.new

new_game.start_game
new_game.welcome

new_game.answer = word.pick_category(new_game.name)
word.show_hidden_word
new_game.guess