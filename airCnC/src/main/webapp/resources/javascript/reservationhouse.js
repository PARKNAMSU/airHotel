/**
 * 
 */
var openWin;
var btn;



function openSetRate(){
		var left_center = Math.ceil(( window.screen.width/2) - (570/2));
		var top_center = Math.ceil(( window.screen.width/2) - (700/2));
		openWin = window.open("rankpopup.do","rankpopup","width=570, height=350, resizable = no, scrollbars = no left ="+left_center+" top="+top_center);
}
function closeWindow(){
	opener.document.getElementById("comments_rate").value = document.getElementById("comments_rate").value
	
	opener.document.getElementById("commentsForm").submit();
	self.close();
}

var openDeclaration  = function(){
	var left_center = Math.ceil(( window.screen.width - 660 )/2);
	var top_center = Math.ceil(( window.screen.width - 740 )/2);
	openWin = window.open("declarationpopup.jsp","rankpopup","width=660, height=370, resizable = no, scrollbars = no")
}
var openMessage  = function(){
	var left_center = Math.ceil(( window.screen.width - 660 )/2);
	var top_center = Math.ceil(( window.screen.width - 740 )/2);
	openWin = window.open("messagepopup.jsp","rankpopup","width=660, height=370, resizable = no, scrollbars = no left="+left_center+" top="+top_center)
}


var openSetRateUpdate = function(seq,house_seq,content){
	var left_center = Math.ceil(( window.screen.width/2) - (570/2));
	var top_center = Math.ceil(( window.screen.width/2) - (700/2));
	console.log(content)
	openWin = window.open("updateCommentsPage.do?comments_seq="+seq+"&comments_house_seq="+house_seq+"&comments_content="+content,"rankpopup","width=570, height=350, resizable = no, scrollbars = no left ="+left_center+" top="+top_center);
	
}

