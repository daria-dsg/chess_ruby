# Chess game

Command line chess game created with Ruby.


![chess_demo](https://user-images.githubusercontent.com/94113384/200244723-82f88264-3c4f-4413-96bc-ebe0f9cd938b.gif)

#### Intro
The goal of the project was to write a chess-game using object-oriented programming. I wanted to practice design patterns and become familiar with class's inheritance.

#### To play
Clone the repo and type "ruby game.rb" into your terminal.
I implemented keypresseed user input: 
* to move cursors, use arrows
* to select the piece or tile, use enter or space

#### Design patterns
*  Sliding and Steppable module that allow return possible moves depending on type of piece and directions. 
*  Singleton module and Null Piece class for empty tiles which is created once while we set up the board. 

#### Features
*  Colorized tiles depending on selected state of the cursor
*  Colorized piece when it is selected
*  Checking if the player in check or check mate 
*  Deep duping of the board to help identify if the move will lead to check mate
* Handling the wrong input from user



