$(document).ready(function() {
	$(document).on("click", ".wizard-next", function() {
		var currentStep = $($(this).parents()[2]).attr("data-step");
		var nextStage = $('div[data-step="' + (parseInt(currentStep) + 1) + '"]');
		if (nextStage.length == 0) return;
		$($($(this).parents()[2])).fadeOut(1000, function() {
			$(nextStage).fadeIn(1000);
		});
	});

	$(document).on("click", ".wizard-previous span", function() {
		var currentStep = $($(this).parents()[2]).attr("data-step");
		var nextStage = $('div[data-step="' + (parseInt(currentStep) - 1) + '"]');
		if (nextStage.length == 0) return;
		$($($(this).parents()[2])).fadeOut(1000, function() {
			$(nextStage).fadeIn(1000);
		});
	});

	$(document).on("click", ".wizard-content-checkbox div", function() {
		if ($(this).hasClass("wizard-content-checkbox-selected")) {
			$(this).removeClass("wizard-content-checkbox-selected");
			$(this).find("span").removeClass("wizard-content-checkbox-selected-span");
		} 
		else {
			$(this).addClass("wizard-content-checkbox-selected");
			$(this).find("span").addClass("wizard-content-checkbox-selected-span");
		}
	});
});