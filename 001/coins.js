function coins(amount){
    var qCount = 0;
    var dCount = 0;
    var nCount = 0;
    var pCount = 0;
    
    
    qCount = Math.floor(amount / .25);
     amount = amount % .25;
     console.log(qCount)
     
    dCount = Math.floor(amount / .10);
     amount = amount % .10;
     console.log(dCount)
     
    nCount = Math.floor(amount / .05);
     amount = amount % .05;
     console.log(nCount)
     
    pCount = Math.round(amount / .01);
    console.log(pCount)
     
     console.log("You have " + qCount+ " Quarters,"+ dCount +" Dimes,"+nCount+ " Nickels, and "+pCount+ " Pennies.")
    
}

coins(1.26)