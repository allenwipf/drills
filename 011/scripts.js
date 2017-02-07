window.addEventListener("load", function () {


	// This function adds an EvenListener to the Post Like button
	function postLike(){
		document.getElementsByClassName("action action--like")[0].addEventListener("click", changePostLikes)	
	}


	// Loops through the comment likes and adds a click event
	function commentLike(){
	var list = document.getElementsByClassName("comment__info");
		for (var i = 0; i < list.length; i++){
			document.getElementsByClassName("comment__info")[i].childNodes[1].addEventListener("click", changeCommentLikes);
	    }

	}

	function showComments(){
	var list = document.getElementsByClassName("comment media");
		for (var i = 0; i < list.length; i++){ 
			document.getElementsByClassName("comment media")[i].childNodes[3].childNodes[3].childNodes[3].addEventListener("click", CommentsShow);
	    }

	}

	postLike()
	commentLike()
	showComments()
})



// This function changes "Like" to "Unlike" and vice versa and increments total likes accordingly
function changePostLikes(){
	// This varialbe get the number of likes for the parent Post
	var postLikes = parseInt((document.getElementsByClassName("post__info")[0].childNodes[1].innerText).split(" ")[0])

	if (this.innerHTML == "Like") {
	    this.innerText = "Unlike";
	    document.getElementsByClassName("post__info")[0].childNodes[1].innerText = (postLikes + 1) + " likes"
	
	} else {
		this.innerText = "Like";
		// document.getElementsByClassName("action action--like")[0].innerText = "Like";
		document.getElementsByClassName("post__info")[0].childNodes[1].innerText = (postLikes - 1) + " likes"
}
}

function changeCommentLikes(){
	
	var likeCount = parseInt((this.parentElement.childNodes[5].innerText).split(" ")[0])
	
	if (this.innerText == "Unlike") {
    	this.innerText = "Like";
    	document.getElementsByClassName("comment__info")[0].childNodes[5].innerText = (likeCount - 1) + " likes"
    	this.parentElement.childNodes[5].innerText = (likeCount - 1) + " likes"
	
	} else {
		
		this.innerText = "Unlike";
		this.parentElement.childNodes[5].innerText = (likeCount + 1) + " likes"
}
}

function CommentsShow(){

	 currentStyle = this.parentElement.parentElement.childNodes[5].style.display
	 this.parentElement.parentElement.childNodes[5].style.display

	if (currentStyle == "none") {
		this.parentElement.parentElement.childNodes[5].style.display = "block"
	
	} else if (currentStyle == "block") {
		
		this.parentElement.parentElement.childNodes[5].style.display = "none"
	}

}







