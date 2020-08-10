/**
 * 
 */


$(function(){
	$("#searchYears").click(function(){
		$("#years").fadeToggle("slow");
		$("#years_temp").fadeToggle("slow");
	}),
	$("#searchYear").click(function(){
		$("#year").fadeToggle("slow");
		$("#year_temp").fadeToggle("slow");
	}),
	$("#searchMonth").click(function(){
		$("#month").fadeToggle("slow");
		$("#month_temp").fadeToggle("slow");
	}),
	$("#searchCondition").click(function(){
		$("#condition").fadeToggle("slow");
		$("#condition_temp").fadeToggle("slow");
	})
})
function openDetail(){
	window.open("salesChartDetail.mdo",'aa',"width=1200, height=900, resizable = no, scrollbars = no")
}
function openSignupDetail(){
	window.open("signupChartDetail.mdo",'aa',"width=1200, height=900, resizable = no, scrollbars = no")
}
function openHostDetail(){
	window.open("hostChartDetail.mdo",'aa',"width=1200, height=900, resizable = no, scrollbars = no")
}
function openResDetail(){
	window.open("resChartDetail.mdo",'aa',"width=1200, height=900, resizable = no, scrollbars = no")
}