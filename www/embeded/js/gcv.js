/**
 * GESTION DES DECONNEXIONS ET DES ZONES RESTREINTES POUR AJAX
 */

(function() {

	Ext.onReady(function() {
		Ext.Ajax.on("requestcomplete",
				function(conn, response, options, eOpts) {

				});
		Ext.Ajax.on("requestexception",
				function(conn, response, options, eOpts) {
					switch (response.status) {
					case 401:
						errorSession();
						break;
					case 403:
						errorAcl();
						break;
					default:
						break;
					}
				});
	});
	jQuery(document).ready(function() {
		jQuery(document).ajaxError(function(e, jqxhr, settings, exception) {
			switch (jqxhr.status) {
			case 401:
				errorSession();
				break;
			case 403:
				errorAcl;
				break;
			default:
				break;
			}
		});
	});

	function errorSession() {
		alert("Session timed out, you will be redirected");
		redirect();
	}
	function errorAcl() {
		alert("Access restricted");
		redirect();
	}
	function redirect() {
		document.location.href = BASE_URL;
	}

	/**
	 * GESTION MULTI ONGLET
	 */

	var currentDate = new Date();
	var idTab = currentDate.toGMTString();
	var multiTabDetected = false;
	var avertRedirect = false; 
	var i = 0;
	
	createCookie("GCV_TAB_ID", idTab);
	// console.log("creation du cookie avec " + idTab);
	var timer = setInterval(function checkMyIdTab() {
		var value = readCookie("GCV_TAB_ID");

		// console.log("Check lapin : " + value + " vs " + idTab);
		if (value != idTab) {
			multiTabDetected = true;
		}
	}, 5000);
	$(window).focus(
					function() {
						if (multiTabDetected && !avertRedirect) {
							avertRedirect = true;
							i++;
							var askEveryTime = true;
							if(readCookie("GCV_TAB_AskReload") == "true"){
								askEveryTime = false;
							}else{
								askEveryTime = true;
							}
							if(askEveryTime){
								alert("<?php echo $this->_("You are using more than one instance of the application, we have to reload the current page.","none") ?>");
								if(confirm("<?php echo $this->_("Do you want skeep this notification and reload automatically ?","none") ?>")){
									createCookie("GCV_TAB_AskReload", true);
								}
							}													
							document.location.href = document.location.href;
						}
	});

})();

function myMethod() {
	alert('window.myMethod() called');
}

var myObject = {
	myMethod : function() {
		alert('myObject.myMethod() called');
	},

	callDelayed : function() {
		setTimeout('this.myMethod()', 3000); // la méthode sera appelée au
												// bout de 3 secondes
		setTimeout(function() {
			myObject.myMethod();
		}, 1000); // la méthode se appelée au bout d'1 seconde
	}
};
