	    function request() {
	        return $.ajax({
	            type: "GET",
	            url: "resetLogin.mdo",
	            async: true
	        }).responseText;
	    }
	    window.onbeforeunload = () => {
	        request();
	        return null;
	    }
	    $(function () {
	        $("a").not('#lnkLogOut').click(function () {
	            window.onbeforeunload = null;
	        });
	        $(".btn").click(function () {
	            window.onbeforeunload = null;
	    	});
	    });