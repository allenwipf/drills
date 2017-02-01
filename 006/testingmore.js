var prompt = require('prompt');

prompt.start();

prompt.get(['player1', 'player2'], function (err, result) {

 	//Makes sure the entered ammounts are rock, paper or scissors
	var choices = ['rock','paper', 'scissors'];
	if(checkThis(result.player1)){
		if(checkThis(result.player2)){
	   
			compare(result.player1, result.player2)
	}
	} else {
		console.log("Please type either rock, paper, or scissors!")	
	}

}
)
;

//This function checks who won
function compare(option1, option2) {

	option1 = option1.toLowerCase()
	option2 = option2.toLowerCase()

	//Win logic. Gives
	if (option1 == option2) {
		console.log("It's a Tie! Try again!")

	} else if (option1 == "rock" && option2 == "paper") {
		console.log("Player 2 Wins!")

	} else if (option1 == "scissors" && option2 =="rock") {
		console.log("Player 2 Wins!")

	} else if (option1 == "paper" && option2 =="scissors") {
		console.log("Player 2 Wins!")

	} else {
		console.log("Player 1 Wins!")
	}
}   

//This function checks if a rock, paper or scissors was entered
function checkThis(a){
	var choices = ['rock','paper', 'scissors'];
   for(i=0; i<choices.length; i++)
   {
      if(choices[i] == a)
      return true;
   }
   return false;
}