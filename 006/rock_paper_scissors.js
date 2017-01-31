  var prompt = require('prompt');







function get_weapon() {

prompt.start();

var weapon = {
  properties: {
    type: {
      message: 'What is your choice?',
    },
}
};



prompt.get(weapon, function (err, result)  {

  	console.log(result.type);
    return(result.type);

});

}

the_weapon_choice = get_weapon()
console.log(the_weapon_choice)


// function winner {





// }