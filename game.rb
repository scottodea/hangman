require 'faker'
require 'colorize'
###  NOTES Talk with Gino -- Do we get rid of spaces in answer?
###                          Do we remove punctuation from answer?
###                          Some People include numbers (ex. Android 20) - delete line 97?
###                          Explain check_guess logic
###                          Only works for one runthrough
###                          Need to implement classes further
###                          Need to show wrong letters
###                          Fix harry potter
class Game

    def initialize
        @lives = 7
        @display = []
        start_game
        welcome
        category
        word
        guess
        check_guess
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
    
    def check_guess 
        if @answer.chars.include?(@guess)
            puts "You got a letter!"
            puts
            #↓↓↓ turns answer into @array
            @progress_string = ""
            @array = @answer.chars
            #↓↓↓ checks each element of @array, if guess matches element it remains, otherwise replaced with _
            @array = @array.map do |element|
                if element == @guess
                    "#{@guess}"
                else
                "_"
                end
            end                                                              
            @array = @array.map do |x|
                "#{x} "
            end
            @progress_string = @array.join(",").delete(",")
            print @progress_string
            else
            puts "Uh-oh, hangman just got one stage closer"
            @lives -= 1
            #draw Hangman
        end
    end
end

user = Game.new
