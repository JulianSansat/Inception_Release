Day-Z-RubyGosuGame
==================

A zombie survival top down shooter game in Ruby using Gosu, it was made for a final project of a college discipline. 
  
You will need ruby 1.9.3 and gosu 2D game development library to run this game, then just open the main file. 

About the game logic:  
  Some cool features that I was able to made was the renderization of the map, which is loaded from a text file and it only loads
and draws a matrix of the size of the screen and at the current position of the camera, so we can use a huge map and it won't 
affect the performance of the game. Another thing is the Zombie AI, when they hit a wall they try to go around, and they always
face the player and walk looking at him, this was very tricky at the beginning but then I realize that the zombie and the player
form a rectangle triangle among them, and the value of the cotangent is the value we need to add to the zombie current angle for
it face the player, considering the actual quadrant of the zombie... because the max angle formed between the player and the 
zombie is 90º, and the zombie needs to be able to spin 360º.

OBS: this was done in a hurry for the delivery date, the code still needs to be refactored.
