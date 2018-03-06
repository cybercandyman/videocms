(function($) {
	var $currentEntry = null;
	$.jpt = function() {
		$.jpt.options.init();
		var savebtn = $.jpt.options.libelle_save;
		var cancelbtn = $.jpt.options.libelle_cancel;
		var buttons = {};
		buttons[cancelbtn] = function() {$(this).dialog('close');};
		buttons[savebtn] = function() {
			
			
			if($("#creditsDialogForm").validationEngine({returnIsValid:true}))
			{			
			
				if ($currentEntry != null) {
					editEntry($($.jpt.options.idField1).val(), $($.jpt.options.idField2).val());
				} else {
					addEntry($($.jpt.options.idField1).val(), $( $.jpt.options.idField2).val());
				}
				updateHiddenField();			
				$(this).dialog('close');				
			}
		};
		
		$($.jpt.options.idDialog).dialog(
				{
					modal : true,
					autoOpen : false,
					width : 550,
					height : 180,
					buttons : buttons,
					modal: 'true' ,
					close:function(){	$.validationEngine.closePrompt(".formError",true) ;}
				
				});
		
		$($.jpt.options.idAddLink).click(function() {
			$($.jpt.options.idField1).val("");
			$($.jpt.options.idField2).val("");
			$currentEntry = null;
			$($.jpt.options.idDialog).dialog('open');
		});
		var values = $.jpt.options.data.split($.jpt.options.data_separator);
		for ( var i = 0; i < values.length; i++) {
			var tmp = extractValue(values[i]);
			if (tmp.length == 2) {
				addEntry(tmp[0], tmp[1]);
			}
		}
		$($.jpt.options.idList).sortable({ update: function(event, ui) {updateHiddenField(); }});
	};
	$.extend(
					$.jpt,
					{
						options : {
							li : '<li class="jpt_entry"><span class="jpt_display_value"></span><span class="jpt_hidden_value"></span><span class="jpt_actions"><a href="#" class="jpt_action_edit">edit</a><a href="#" class="jpt_action_delete">delete</a></span></li>',
							ondelete : function(element) {},
							onadd : function(element) {},
							init : function() {},
							data : "",
							data_separator : ";",
							regex : "##",
							idList : "#creditslist",
							idAddLink:"#addcredits",
							idDialog:"#creditsDialog",
							idField1 : "#txt_generals",
							idField2 : "#select_generals",
							hiddenField : "textarea[rel=credits]",
							libelle_save : "Save",
							libelle_cancel : "Cancel"
						}
					});

	function updateHiddenField() {
		var tmp = "";
		$($.jpt.options.idList + " li").each(function(index) {

			tmp = tmp != "" ? tmp + ";" : "";

			tmp = tmp + $(".jpt_hidden_value", $(this)).html();
		});
		$($.jpt.options.hiddenField).val(tmp);
	}
	function editEntry(val1, val2) {
		$(".jpt_display_value", $entry).html(
				val1
						+ " ("
						+ $(
								$.jpt.options.idField2 + " option[value=" + val2
										+ "]").html() + ")");
		hiddenValue = val1 + $.jpt.options.regex + val2;
		$(".jpt_hidden_value", $currentEntry).html(hiddenValue);
		$currentEntry = null;

	}
	function addEntry(val1, val2) {
		$entry = $($.jpt.options.li);
		$(".jpt_display_value", $entry).html(
				val1
						+ " ("
						+ $(
								$.jpt.options.idField2 + " option[value=" + val2
										+ "]").html() + ")");
		hiddenValue = val1 + $.jpt.options.regex + val2;
		$(".jpt_hidden_value", $entry).html(hiddenValue);
		$(".jpt_action_delete", $entry).click(function(event) {
			$(this).parent().parent().remove();
			event.preventDefault();
			$.jpt.options.ondelete();
			updateHiddenField();
		});
		$(".jpt_action_edit", $entry).click(function(event) {
			$entry = $(this).parent().parent();
			hiddenValue = extractValue($(".jpt_hidden_value", $entry).html());
			if (hiddenValue.length == 2) {
				$($.jpt.options.idField1).val(hiddenValue[0]);
				$($.jpt.options.idField2).val(hiddenValue[1]);
			}
			$currentEntry = $entry;
			$("#creditsDialog").dialog('open');
			event.preventDefault();
		});
		$($.jpt.options.idList).append($entry);
	

	}
	function extractValue(formattedValue) {

		var reg = new RegExp($.jpt.options.regex, "g");
		var array = formattedValue.split(reg);
		return array;
	}
})(jQuery);
