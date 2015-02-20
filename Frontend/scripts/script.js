$(document).ready(function() {
	$.get("partials/header.html", function(data) {
		$("body").prepend(data);
	});

	$.get("partials/footer.html", function(data) {
		$("body").append(data);
	});
});
