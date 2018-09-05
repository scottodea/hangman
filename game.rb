require 'colorize'
require_relative 'hangman'
require_relative 'word'

class Game
    attr_accessor :name, :answer, :hidden_word

    def initialize
        @mistakes = 0
        @answer = []
        @progress_array = []
        @progress_string = ""
        @name = ""
        @guess = ''
        @wrong_letters = []
        @hidden_word = ""
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
        while @name = gets.chomp
            system('clear')
            if @name.strip == ""
                puts "Please enter a name:"
            else
                break
            end
        end
        # if name starts with a number, do not capitalize it
        if @name.capitalize! == nil   
            @name.strip!
        else
            @name.capitalize!
            @name.strip!
        end
        system('clear')
    end

    def guess
        hangman = Hangman.new
        while @mistakes < 6 do 
            if @wrong_letters.length > 0
                print "Wrong guesses: #{@wrong_letters.join(', ')}"
            end
            puts
            puts "Please enter a letter or single digit: "
            loop do
                @guess = gets.chomp
                if @guess.is_a? String     
                    @guess.upcase!
                end

                if @guess == ""
                    puts "You didn't enter anything. Try again:"
                elsif !@guess.match(/\A[a-zA-Z0-9]*\z/)
                    puts "Please only enter a letter or number. Try again:"
                elsif @guess.chars.count > 1
                    puts "Only one character please! Please guess again:"
                elsif @wrong_letters.count(@guess) == 1
                    puts "You have already guessed this letter. Please guess again:"
                elsif @progress_array.count(@guess) > 0
                    puts "You have already correctly guessed this letter. Please guess again:"
                else 
                    break
                end
            end
            # check guess
            if @answer.chars.include?(@guess)
                system('clear')
                puts "You got a letter!"
                puts
                # convert the answer into a char array. place the correct guess in it's corresponding spot
                # and replace all un-guessed chars with an underscore
                # if there is a space do not put an underscore
                @array = @answer.chars
                @array = @array.map do |element|
                    if element == @guess
                        "#{@guess}"
                    elsif element == " "
                        " "
                    else
                        "_"
                    end
                end     
                if @progress_array.length == 0
                    @progress_array = @array                    
                else
                    # update guess_array with new correct guess
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
                hangman.draw(@mistakes)
            else
                system('clear')
                puts "Uh-oh, hangman just got one stage closer:"
                puts
                @mistakes += 1
                if @progress_array.length == 0
                    puts @hidden_word
                else
                    # print "@progress array is: #{@progress_array}"
                    # puts
                    # print "@array is: #{@array}"
                    # puts
                    # @progress_array = @array
                    @progress_string = @progress_array.join(",").delete(",")    
                    i = 0
                    while i < @progress_string.length do
                        print "#{@progress_string[i]} "
                        i += 1                
                    end
                end
                puts
                hangman.draw(@mistakes)
                puts
                if @mistakes == 6
                    puts "The answer was #{@answer}"
                end
                @wrong_letters << @guess
            end
            # player wins once progress_array does not contain an underscore
            # and prevents them from winning upon initialization
            if @progress_array.include?("_") == false and @progress_array != []
                system('clear')
                print "The word was: "
                @progress_string = @progress_array.join(",").delete(",")    
                i = 0
                while i < @progress_string.length do
                    print "#{@progress_string[i]} "
                    i += 1                
                end
                puts
                puts
                puts
                puts
                puts'/\ \_\ \   /\  __ \   /\ \/\ \      /\ \  _ \ \   /\ \   /\ "-.\ \ '   
                puts'\ \____ \  \ \ \/\ \  \ \ \_\ \     \ \ \/ ".\ \  \ \ \  \ \ \-.  \ ' 
                puts' \/\_____\  \ \_____\  \ \_____\     \ \__/".~\_\  \ \_\  \ \_\"\_ \ '
                puts'  \/_____/   \/_____/   \/_____/      \/_/   \/_/   \/_/   \/_/ \/_/   '
                puts
                puts
                puts
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
new_game.hidden_word = word.show_hidden_word
new_game.guess