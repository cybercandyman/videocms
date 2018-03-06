(function($) { 
	$.fn.validationEngineLanguage = function() {};
	$.validationEngineLanguage = {
		newLang: function() {
			$.validationEngineLanguage.allRules = {"required":{
						"regex":"none",
						"alertText":"* <?php echo $this->_("This field is required")?>",
						"alertTextCheckboxMultiple":"* <?php echo $this->_("Please select an option")?>",
						"alertTextCheckboxe":"* <?php echo $this->_("This checkbox is required")?>"},
					"length":{
						"regex":"none",
						"alertText":"* <?php echo $this->_("Between")?> ",
						"alertText2":" <?php echo $this->_("and")?> ",
						"alertText3": " <?php echo $this->_("characters allowed")?>"},
					"maxCheckbox":{
						"regex":"none",
						"alertText":"* <?php echo $this->_("Checks allowed Exceeded")?>"},	
					"minCheckbox":{
						"regex":"none",
						"alertText":"* <?php echo $this->_("Please select")?> ",
						"alertText2":" <?php echo $this->_("options")?>"},	
					"confirm":{
						"regex":"none",
						"alertText":"* <?php echo $this->_("Your field is not matching")?>"},		
					"telephone":{
						"regex":"/^[0-9\-\(\)\ ]+$/",
						"alertText":"* <?php echo $this->_("Invalid phone number")?>"},	
					"email":{
						"regex":"/^[a-zA-Z0-9_\.\-]+\@([a-zA-Z0-9\-]+\.)+[a-zA-Z0-9]{2,4}$/",
						"alertText":"* <?php echo $this->_("Invalid email address")?>"},	
					"date":{
                         "regex":"/^[0-9]{4}\-\[0-9]{1,2}\-\[0-9]{1,2}$/",
                         "alertText":"* <?php echo $this->_("Invalid date, must be in YYYY-MM-DD format")?>"},
					"onlyNumber":{
						"regex":"/^[0-9\ ]+$/",
						"alertText":"* <?php echo $this->_("Numbers only")?>"},	
					"noSpecialCaracters":{
						"regex":"/^[0-9a-zA-Z]+$/",
						"alertText":"* <?php echo $this->_("No special caracters allowed")?>"},	
					"ajaxUser":{
						"file": BASE_URL + "default/user/isavailable/format/ajax/type/login",
						"extraData":"",
						"alertTextOk":"* <?php echo $this->_("This user is available")?>",	
						"alertTextLoad":"* <?php echo $this->_("Loading, please wait")?>",
						"alertText":"* <?php echo $this->_("This user is not available")?>"},
					"ajaxCode":{
						"file": BASE_URL + "default/user/isavailable/format/ajax/type/code",
						"extraData":"",
						"alertTextOk":"* <?php echo $this->_("This code is available")?>",	
						"alertTextLoad":"* <?php echo $this->_("Loading, please wait")?>",
						"alertText":"* <?php echo $this->_("This code is already taken")?>"},
					"ajaxMail":{
						"file": BASE_URL + "default/user/isavailable/format/ajax/type/mail",
						"extraData":"",
						"alertText":"* <?php echo $this->_("This email is not available")?>",
						"alertTextOk":"* <?php echo $this->_("This email is available")?>",	
						"alertTextLoad":"* <?php echo $this->_("Loading, please wait")?>"},	
					"ajaxGroupName":{
						"file": BASE_URL + "prod/program/isavailable/format/ajax/type/groupname",
						"extraData":"",
						"alertText":"* <?php echo $this->_("This group name is not available")?>",
						"alertTextOk":"* <?php echo $this->_("This group name is available")?>",	
						"alertTextLoad":"* <?php echo $this->_("Loading, please wait")?>"},	
					"ajaxGroupCode":{
						"file": BASE_URL + "prod/program/isavailable/format/ajax/type/groupcode",
						"extraData":"",
						"alertText":"* <?php echo $this->_("This group code is already taken")?>",
						"alertTextOk":"* <?php echo $this->_("This group code is available")?>",	
						"alertTextLoad":"* <?php echo $this->_("Loading, please wait")?>"},
							
					"onlyLetter":{
						"regex":"/^[a-zA-Z\ \']+$/",
						"alertText":"* <?php echo $this->_("Letters only")?>"}
					}	
				
		}
	}
})(jQuery);

$(document).ready(function() {	
	$.validationEngineLanguage.newLang()
});