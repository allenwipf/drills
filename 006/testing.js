var prompt = require('prompt');

prompt.start();

prompt.get(['player1', 'player2'], function (err, result) {
	console.log('Player choices:');
    console.log('Player 1 Choice: ' + result.player1);
    console.log('Player 2 Choice: ' + result.player2);

    x = result.player1
    console.log(x)


});

// call a function on the outside inside that function