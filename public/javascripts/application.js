$(document).ready(function() {
	$('#flash_messages').fadeOut(9000);
	$(".show_openid_form").attach(ToggleLoginForm);
});

ToggleLoginForm = $.klass({
	onclick: function() {
		$("#standard_login").toggle();
		$("#openid_login").toggle();
		
		if ($("#standard_login").css("display") == "none")
			this.element.text("Standard Login");
		else
			this.element.text("OpenID Login");
		end
	}
});