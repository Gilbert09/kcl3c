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

	var options = {
		url: "/file/post",
		previewsContainer: "#wizard-rooms-uploaded",
 		previewTemplate: $("#wizard-rooms-uploaded").html(),
 		thumbnailWidth: 50,
  		thumbnailHeight: 50,
  		acceptedFiles: "image/*",
  		maxFiles: 4,
  		init: function() {
		    this.on("addedfile", function() {
		      if (this.files[4]!=null){
		        this.removeFile(this.files[0]);
		      }
		    });
	  	}
	}

	$("#wizard-rooms-fileupload").dropzone(options);
	$("#wizard-rooms-fileupload span").dropzone(options);

	$(document).on("click", ".wizard-room-list div", function() {
		$(".wizard-room-list-selected").removeClass("wizard-room-list-selected");
		$(this).addClass("wizard-room-list-selected");
	});

	$(document).on("click", "#wizard-room-meters", function() {
		$("#wizard-room-feet").removeClass("wizard-room-selected");
		$(this).addClass("wizard-room-selected");
	});

	$(document).on("click", "#wizard-room-feet", function() {
		$("#wizard-room-meters").removeClass("wizard-room-selected");
		$(this).addClass("wizard-room-selected");
	});
});
