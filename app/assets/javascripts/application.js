// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//=require jquery
//=require jquery_ujs
//= require_tree .
var curentSlideIndex = 0;
var nextSlideIndex = curentSlideIndex + 1;
var intervalId = 0;
//define the slide array, for all the slide you want put on the index page, you must add it here explicitly 
var slideArray = ["bridge.jpg", "shelter.jpg", "leaf.jpg", "road.jpg", "sea.jpg"];
// slide show interval invocation, switch slide each 5000 millseconds

var sendSMSUrl = "http://api.sms7.com.cn/mt/?uid=ruby&pwd=f2bd8f3d021082f7bc13b1d566c00f67&encode=utf8";

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
	
	        //$("#user_div").hide();
	$("#login_swith_btn").click(function(){
	    $("#user_div").toggle();
	});
	
  	$("#user_div").mouseout(function(){
	    $("body").mouseup(function(){
	     //   $("#user_div").hide();alert(2333);
	    });
	});

	$("#sendSMS").click(function(){
	    var mobile = $("#user_phonenum").val();
	    
            if(mobile == null || mobile =="")
	    {alert("手机号码不能为空");return;}
	    if(mobile.length !=11)
	    {alert("请输入正确的手机号码");return;}
		
	    var content = getAuthCode();
	    var url = sendSMSUrl + "&mobile=" + mobile + "&content=【宁品网】验证码:" + content;
	    $("#auth_hiddenAuthCode").val(content);
	    //$.post(url, function(){alert(11);});
	    jQuery.getScript(url,function(){alert("短信已发送，请查收!")});
	    disableSMSBtnAndCountDown();
	});

	$("#shipping_addr_child").click(function(){
	//alert($("#shipping_addr_child + label").html());
	    $(".ship_addr").val($("#shipping_addr_child + label").html());
	});

	$("#increase").click(function(){
            //increate the value when click increase btn
	    $("#order_amount").val(Number($("#order_amount").val()) +1);
	    
	    if($("#order_amount").val() > 100 )
		$("#order_amount").val(100);

	    $("#order_total_price").val( $("#single_price").val() * $("#order_amount").val());
	});

	$("#decrease").click(function(){
            //increate the value when click increase btn
            $("#order_amount").val(Number($("#order_amount").val()) -1);
        
            if($("#order_amount").val() < 1 )
                $("#order_amount").val(1);
	    
            $("#order_total_price").val( $("#single_price").val() * $("#order_amount").val());
        });

	$("#order_amount").focusout(function(){
	    if(!$.isNumeric ($(this).val()))
             {  
		alert("正确的输入为1-100之间的数字");
		$(this).val(1);
	     }

	    if($(this).val() >100)
		$(this).val(100);
	    
	    if($(this).val() <1)
                $(this).val(1);

	    $("#order_total_price").val( $("#single_price").val() * $(this).val());
	});
	
	$(document).on("click","#addAddr",function(){
	    //check the maximum address
	    if($(".ship_addrs").find("p").length >= 100)
	    { alert("您最多可以预留6个收货地址，当前已经达到最大值");return; }
	    alert(1111);
	    if($(this).hasClass("switcher"))
	    {    
		$(this).html("取消添加"); 
		$(this).toggleClass("switcher");    
	        $("#new_address").show(250);
	    }
	    else
	    {   
		$(this).html("添加收货地址"); 
		$(this).toggleClass("switcher");    
	        $("#new_address").hide(250);
	    }
	
	    alert(2222);
	});
	
	$("#btn4save").click(function(){
            if(!$.isNumeric ($("#address_postcode").val()) || $("#address_postcode").val().length !=6)
             {
                alert("请输入正确的6位数邮编");
		return;
             }
	    $("#saveAddr").click();
	});
});
var cd =  60;
var cdItvID = null;
function disableSMSBtnAndCountDown()
{
	$("#sendSMS").attr("disabled","true");
	cdItvID = setInterval("countDown()", 1000);
}

function abc()
{
	alert("big brother");
}

function countDown()
{
	if(cd >=0)
	{
	  $("#sendSMS").val("发送验证短信(" + cd + ")");
	  cd--;
	}
	else
	{	
	  $("#sendSMS").removeAttr("disabled");
	  $("#sendSMS").val("发送验证短信");
	  cd = 60;
	  clearInterval(cdItvID);
	}
}

//return a auth code from 100000 to 999999
function getAuthCode()
{
	return parseInt(Math.random() * (999999 - 100000 + 1) + 100000);
}

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
