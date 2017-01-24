//non working!!!!

function transpo(string){

 //loops through the array
 for (var i = 0; i <= string.length -1; i++){
   
     var eachString = (string[i].split(" "));
     
     
     //loops through each word in the array

    var splitString = string.split("");
    for (var i = 0; i <= splitString.length -1; i++)
    console.log(splitString[i])


   //console.log(string)

return string;
}
}
}

transpo(["hello", "you"]);