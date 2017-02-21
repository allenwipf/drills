window.addEventListener("load", function(){

	
    document.getElementsByTagName("input")[1].addEventListener("click", getInfo)
    document.getElementsByClassName("prev")[0].addEventListener("click", negVar)
    document.getElementsByClassName("next")[0].addEventListener("click", plusVar)   
});


function getInfo(e){

	movieArrayNum = 0
    textField = document.getElementsByTagName("input")[0].value
    var getRequest = new XMLHttpRequest();
    getRequest.open('GET', '/results?query=' + textField);

    getRequest.onload = function() {

        rawData = JSON.parse(getRequest.responseText);

        document.getElementsByClassName("nav")[0].style.display = "block"

        createHtml(rawData)
    };
    getRequest.send();
    e.preventDefault()   
}

function plusVar(e){

	if (movieArrayNum < rawData.Search.length -1){
		movieArrayNum ++
		createHtml(rawData)
	} else {

		document.getElementsByClassName("next")[0].style.display = "none";
	}

	document.getElementsByClassName("prev")[0].style.display = "inline-block";	
}

function negVar(e){
 
	if (movieArrayNum > 0){
		movieArrayNum --
		createHtml(rawData)
	} else {

		document.getElementsByClassName("prev")[0].style.display = "none";
	}
	document.getElementsByClassName("next")[0].style.display = "inline-block";	
}

function createHtml(rawData){

	var movie = rawData.Search[movieArrayNum]

	htmlString = (movieArrayNum + 1) + " of " + (rawData.Search.length) + "<br>"
	+ "<strong>" + movie.Title + "</strong>" + "<br>" 
	+ "<img src=" + movie.Poster + "> </br>"
	+ movie.Year + " " + movie.Type + "<br>" + "IMBD Id = " +  + " " + movie.imdbID

	document.getElementsByClassName("movieInfo")[0].innerHTML = htmlString
}