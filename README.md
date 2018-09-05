## hangman
Hangman terminal game
github link -- https://github.com/ginodleon/hangman

### Description of our terminal application
Purpose
- The purpose of our terminal app is to provide an entertaining and interactive version of the classic hangman game.
- This game is designed to appeal to game-lovers of any age, and we implemented 5 different categories to choose from
to make the game feel customizable to the gamer's interests.
Functionality
- We used three classes (Game, Word and Hangman) to isolate particular tasks we required from our application. Isolating the tasks like this made our coding process much easier. It allowed for more efficient navigation in our code as methods specific to each class could be easily found.
- The class 'Game' is used to initiate the game.
- The class 'Word' is used to generate our randomly selected character from the gem "faker" and to edit out punctuation "faker" generates (such as Mr. Mime)
- The class 'Hangman' contains our hangman drawing that is called each time a mistake is made in the game.
- Instance variables are used to share variables within each class.
- While and do loops are used to repeat methods. This saves calling methods multiple times
- User mistakes are incremented as wrong guesses are input using the += functionality
- Punctuation is removed using regex(regular expression)
- If, elsif and else statements are used to take user down different paths in the game depending on whether their input is correct or incorrect.
- Music in the game is accessed using the "system ('afplay)" command


### Instructions for use
1. Clone Git repository from provided link
2. Open Terminal
3. Type 'gem install colorize'(if you don't already have it)
  hit enter - terminal will install colorize gem
4. Type 'gem install faker'(if you don't already have it)
  hit enter - terminal will install faker gem
5. Navigate to directory containing cloned git repository
6. Type "ruby game.rb"
7. Game will begin
8. Follow commands given by the game
9. Enjoy!

### User Flowchart:
![User Flowchart](https://github.com/ginodleon/hangman/blob/master/docs/flowchart.jpg)

### Trello Board:
![Trello board](https://github.com/ginodleon/hangman/blob/master/docs/Trello_board.jpg)

### Screenshots:
- Welcome screen
![Enter name](https://github.com/ginodleon/hangman/blob/master/docs/2enter_name.png)

- Category selection
![Pick a category](https://github.com/ginodleon/hangman/blob/master/docs/3category.png)

- Guessing a character
![Enter a guess](https://github.com/ginodleon/hangman/blob/master/docs/4guess.png)

- Correct guess screen
![Correct guess](https://github.com/ginodleon/hangman/blob/master/docs/5correct.png)

- Incorrect guess screen
![Incorrect guess](https://github.com/ginodleon/hangman/blob/master/docs/6wrong.png)

- Winning screen
![Win screen](https://github.com/ginodleon/hangman/blob/master/docs/7win.png)

- Gameover screen
![Lose screen](https://github.com/ginodleon/hangman/blob/master/docs/8lose.png)








