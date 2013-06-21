var curentSlideIndex = 0;
var nextSlideIndex = curentSlideIndex + 1;
var intervalId = 0;
//define the slide array, for all the slide you want put on the index page, you must add it here explicitly 
var slideArray = ["bridge.jpg", "shelter.jpg", "leaf.jpg", "road.jpg", "sea.jpg"];
// slide show interval invocation, switch slide each 5000 millseconds

$(document).ready(function() {
		// show the slide via invoke setInterval
		intervalId = setInterval("slideShow()", 5000);
		
		// stop slide swith when mouseover on the image or thumbnails
		$("#camera_img, .thumbnail_img").mouseover(function(){
			clearInterval(intervalId);
		});
		
		// resume the slide show when mouse out from image or thumbnails
		$("#camera_img, .thumbnail_img").mouseout(function(){
			intervalId = setInterval("slideShow()", 5000);
		});

		// response when click on the thumbnails
		$(".thumbnail_img").click(function(){
			//change the thumbnail path to image path
			var path = $(this).attr("src").replace("thumbs/", "");

			$("#camera_img").fadeOut(1000, function(){
				$("#camera_img").attr("src", path);
			});
			$("#camera_img").fadeIn(1000);

			$(".thumbnail_img").removeClass("thumbnail_hover");
			 $(this).toggleClass("thumbnail_hover");
			
			//change the curentSlideIndex to the slide index user just clicked, next time the slide show will start from this one
			 curentSlideIndex = jQuery.inArray($(this).attr("src").replace("images/thumbs/",""), slideArray);
		});
});

function slideShow()
{
	if( curentSlideIndex+1 >= slideArray.length)
		nextSlideIndex = 0;
	else
		nextSlideIndex = curentSlideIndex +1;

	showSlideByIndex();
	
	if( curentSlideIndex >= slideArray.length)
		curentSlideIndex =0;

	
}

function showSlideByIndex()
{
	currentSlideStr = "images/" + slideArray[curentSlideIndex];
	nextSlideStr = "images/" + slideArray[nextSlideIndex];
	cThumbStr = "images/thumbs/" + slideArray[curentSlideIndex];
	nThumbStr = "images/thumbs/" + slideArray[nextSlideIndex];
	// Invoke fadeOut and fadeIn to reailze animation 
	$("#camera_img").fadeOut(1000, function(){
				$("#camera_img").attr("src", nextSlideStr);
			});
	$("#camera_img").fadeIn(1000);
	
	// swith class for the thumbnails
	//$("img[src='" + nThumbStr + "']").toggleClass("thumbnail_hover");
	$(".thumbnail_img").removeClass("thumbnail_hover");
	$("img[src='" + nThumbStr + "']").toggleClass("thumbnail_hover");
	curentSlideIndex ++;
}