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

var openDeclaration  = function(hostid,guestid){
	console.log(hostid)
	var left_center = Math.ceil(( window.screen.width - 660 )/2);
	var top_center = Math.ceil(( window.screen.width - 740 )/2);
	openWin = window.open("declaration.do?blame_member_id="+guestid+"&blame_target_member_id="+hostid,"rankpopup","width=660, height=370, resizable = no, scrollbars = no")
}
var openMessage  = function(fromId,toId){
	var left_center = Math.ceil(( window.screen.width - 660 )/2);
	var top_center = Math.ceil(( window.screen.width - 740 )/2);
	openWin = window.open("openMessageFromDetail.do?message_from_id="+fromId+"&message_to_id="+toId,"rankpopup","width=660, height=370, resizable = no, scrollbars = no left="+left_center+" top="+top_center)
}


var openSetRateUpdate = function(seq,house_seq,content){
	var left_center = Math.ceil(( window.screen.width/2) - (570/2));
	var top_center = Math.ceil(( window.screen.width/2) - (700/2));
	console.log(content)
	openWin = window.open("updateCommentsPage.do?comments_seq="+seq+"&comments_house_seq="+house_seq+"&comments_content="+content,"rankpopup","width=570, height=350, resizable = no, scrollbars = no left ="+left_center+" top="+top_center);
	
}

