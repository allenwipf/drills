window.addEventListener("load", function(){

    getInfo()

});



function getInfo(){

    var getRequest = new XMLHttpRequest();
    getRequest.open('GET', '/people');

    getRequest.onload = function() {

        var ourData = JSON.parse(getRequest.responseText);

        renderHTML(ourData)
    };
    getRequest.send();

}


function renderHTML(rawData){


    for (x = 0; x <= rawData.length; x++) {

        htmlString = "<p class='name'>" + rawData[x].fname + " " + rawData[x].lname + "<br>" +
            rawData[x].tel + "<br>" +
            rawData[x].address + "<br>" +
            rawData[x].city + "<br>" +
            rawData[x].state + "<br>" +
            rawData[x].zip + "<br>"

        document.getElementsByTagName("body")[0].insertAdjacentHTML("beforeend", htmlString) 

    }
    console.log(rawData)
    
}