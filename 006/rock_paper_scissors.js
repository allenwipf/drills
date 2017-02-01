var prompt = require('prompt');

//This sets each players score to 0
var p1_score = 0;
var p2_score = 0;

//This calls the begingame function to begin the game
beginGame();

//This function checks for a game winner and starts the next round if non found
function beginGame(){
	

	if ((p1_score > 0) || (p2_score > 0)) {
		console.log()
		console.log("The score is Player 1: " + p1_score + " and Player 2: " + p2_score);
		
	}

	if (p1_score == 3){

 		console.log("Game Over! Player 1 wins");

	} else if (p2_score == 3){

		console.log("Game Over! Player 2 wins");

	} else {
		console.log();
		console.log("Player 1, please enter a weapon!");
		player1();

	}
}


//This functin gets the result of player 1
function player1(){

	prompt.get(['player1'], function (err, result) {

	 	//Makes sure the entered ammounts are rock, paper or scissors
		var choices = ['rock','paper', 'scissors'];
		if(illegal_words(result.player1)){
			console.log();
		    console.log("Player 1, please enter a weapon!");
		    
			player2(result.player1);

		} else {
			console.log();
			console.log("It seems you can't spell. Please type either rock, paper, or scissors!");
			beginGame();
		}

	}
	)
	;
}

//This function gets the result of player 2
function player2(results_player1){

	prompt.get(['player2'], function (err, result) {
	     

	 	//Makes sure the entered ammounts are rock, paper or scissors
		var choices = ['rock','paper', 'scissors'];
		if(illegal_words(result.player2)){
			compare(results_player1, result.player2);
		} else {
			console.log();
			console.log("It seems you can't spell. Please type either rock, paper, or scissors!");
			beginGame();
		}

	}
	)
	;
}


//This function checks who won
function compare(option1, option2) {

	//Win logic. 
	if (option1 == option2) {
		console.log("It's a Tie! Try again!")

	} else if (option1 == "rock" && option2 == "paper") {
		console.log("Player 2 Wins!")
		p2_score ++;

	} else if (option1 == "scissors" && option2 =="rock") {
		console.log("Player 2 Wins!")
		p2_score ++;

	} else if (option1 == "paper" && option2 =="scissors") {
		console.log("Player 2 Wins!")
		p2_score ++;

	} else {
		console.log("Player 1 Wins!")
		p1_score ++;
	}

	beginGame()
}   

//This function checks if a rock, paper or scissors was entered
function illegal_words(a){
	var choices = ['rock','paper', 'scissors'];
	for(i=0; i<choices.length; i++){
      if(choices[i] == a)
      return true;
	}
	return false;
}