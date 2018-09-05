class Hangman
    def initialize
        @mistakes = 0
    end
                                                                              
        def draw(mistakes)
            puts
        if mistakes == 1
            i = 0
            while i < 6 do
                puts ''
                i += 1
            end
            puts '  _______'
        elsif mistakes == 2
            i = 0
            while i < 6 do
                puts '   |'
                i += 1
            end
            puts ' _________'
        elsif mistakes == 3
            puts '  _______'
            i = 0
            while i < 6 do
                puts '   |'
                i += 1
            end
            puts ' _________'
        elsif mistakes == 4
            puts '  _______'
            puts '  |     |'
            puts '  |     0'
            puts '  |'
            puts '  |'
            puts '  |'
            puts '  |'
            puts ' _________'
        elsif mistakes == 5
            puts '  _______'
            puts '  |     |'
            puts '  |     0'
            puts '  |    _|_'
            puts '  |     | '
            puts '  |'
            puts '  |'
            puts ' _________'
        elsif mistakes == 6
            puts '  _______'
            puts '  |     |'
            puts '  |     0          ____    ____  ______    __    __      __        ______        _______. _______ '
            puts '  |    _|_         \   \  /   / /  __  \  |  |  |  |    |  |      /  __  \      /       ||   ____|'
            puts '  |     |           \   \/   / |  |  |  | |  |  |  |    |  |     |  |  |  |    |   (----`|  |__   '
            puts '  |    / \           \_    _/  |  |  |  | |  |  |  |    |  |     |  |  |  |     \   \    |   __| '
            puts "  |                    |  |    |  `--'  | |  `--'  |    |  `----.|  `--'  | .----)   |   |  |____"
            puts ' _________             |__|     \______/   \______/     |_______| \______/  |_______/    |_______|'
        end
    end
end
