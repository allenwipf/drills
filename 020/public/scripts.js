// Waits for hte window to load before running functions. 
window.addEventListener("load", function(){

    getInfo()
});


// AJAX request. returns as JSON data
function getInfo(){

    var getRequest = new XMLHttpRequest();
    getRequest.open('GET', '/people');

    getRequest.onload = function() {

        var ourData = JSON.parse(getRequest.responseText);

        renderHTML(ourData)
    };
    getRequest.send();
}

// Takes the JSON from getInfo() and parses the text as HTML and inserts the node into DOM at specified location
function renderHTML(rawData){

    for (x = 0; x <= rawData.length - 1; x++) {

        htmlString = "<div class='name'>" + "<strong>" + rawData[x].fname + " " + rawData[x].lname + "</strong>" + "<br>" +
            rawData[x].tel + "<br>" +
            rawData[x].address + "<br>" +
            rawData[x].city + "<br>" +
            rawData[x].state + " " +
            rawData[x].zip + "<br>" + "<br>" + "</div>"

        document.getElementsByTagName("body")[0].insertAdjacentHTML("beforeend", htmlString) 
    }    
}