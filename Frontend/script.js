$(document).ready(function() {
	$(document).on("click", "#menu-top", function() {
		if ($("#drawer").css("display") == "block") $("#drawer").slideUp(800);
		else $("#drawer").slideDown(800);
	});
});