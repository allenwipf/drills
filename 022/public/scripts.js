window.addEventListener("load", function(){

	movieArrayNum = 0
    document.getElementsByTagName("input")[1].addEventListener("click", getInfo)
    document.getElementsByClassName("prev")[0].addEventListener("click", negVar)
    document.getElementsByClassName("next")[0].addEventListener("click", plusVar)   
});


function getInfo(e){

    textField = document.getElementsByTagName("input")[0].value
    var getRequest = new XMLHttpRequest();
    getRequest.open('GET', '/results?query=' + textField);

    getRequest.onload = function() {

        rawData = JSON.parse(getRequest.responseText);
        createHtml(rawData)
    };
    getRequest.send();
    e.preventDefault()   
}

function plusVar(e){

	if (movieArrayNum < rawData.Search.length){
		movieArrayNum ++
		// getInfo(e)
		createHtml(rawData)
	}
	
}

function negVar(e){
 
	if (movieArrayNum > 0){
		movieArrayNum --
		// getInfo(e)
		createHtml(rawData)
	}
}

function createHtml(rawData){

	var movie = rawData.Search[movieArrayNum]

	htmlString = "<strong>" + movie.Title + "</strong>" + "<br>" 
	+ movie.Year + " " + movie.Type + "<br>"
	+ "<img src=" + movie.Poster + ">"
	+ "<br>" + "IMBD Id = " + movie.imdbID

	document.getElementsByClassName("movieInfo")[0].innerHTML = htmlString

}