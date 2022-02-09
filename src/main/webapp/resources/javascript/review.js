/**
 * 
 */
 
function setThumbnail(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		document.querySelector("div#mid_image").removeChild(img);
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		document.querySelector("div#mid_image").appendChild(img);
	};
	
	reader.readAsDataURL(event.target.files[0]);
}