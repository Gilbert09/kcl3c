var propertyID = window.location.pathname.replace( /^\D+/g, '').substring(0, window.location.pathname.replace( /^\D+/g, '').indexOf("/"));
var rooms = { "rooms": [] }

$(document).ready(function() {
	$(document).on("click", ".wizard-next", function() {
		changeButton();
		var sThis = this;
		var currentStep = $($(this).parents()[2]).attr("data-step");
		var intCurrentStep = parseInt(currentStep);

		//Send data to be save
		var stage = -1;
		var data = "";

		switch (intCurrentStep) {
			case 0:
				stage = 1;
				data = stage1();
				break;
			case 1:
				stage = 2;
				data = stage2();
				break;
			case 2:
				stage = 3;
				data = stage3();
				break;
			case 3:
				stage = 4;
				data = stage4();
				break;
			case 4:
				stage = 5;
				data = stage5();
				break;
			case 5:
				stage = 6;
				data = stage6();
				break;
			case 6:
				stage = 7;
				data = stage7();
				break;
			case 8:
				stage = 8;
				data = stage8();
				break;
			case 9:
				stage = 9;
				data = stage9();
				break;
			default:
				$(".wizard-next").html("Done");
				var nextStage = $('div[data-step="' + (parseInt(currentStep) + 1) + '"]');
				if (nextStage.length == 0) return;
				$($($(sThis).parents()[2])).fadeOut(1000, function() {
					$(nextStage).fadeIn(1000);
					changeButton();
				});
				return;
		}

		if (stage == 7) {
			for (var i = 0; i < data.length; i++) {
				$.ajax({
					url: '/account/listing/' + propertyID + '/save?stage=' + stage + '&data=' + data[i]
				}).done(function(msg) {
					if (msg.result != "Success") {
						var currentStep = $($(this).parents()[2]).attr("data-step");
						var nextStage = $('div[data-step="' + (parseInt(currentStep) - 1) + '"]');
						if (nextStage.length == 0) return;
						$($($(sThis).parents()[2])).fadeOut(1000, function() {
							$(nextStage).fadeIn(1000);
						});
					}
				});
			}
			$(".wizard-next").html("Done");
			var nextStage = $('div[data-step="' + (parseInt(currentStep) + 1) + '"]');
			if (nextStage.length == 0) return;
			$($($(sThis).parents()[2])).fadeOut(1000, function() {
				$(nextStage).fadeIn(1000);
				changeButton();
			});
		} else {
			$.ajax({
				url: '/account/listing/' + propertyID + '/save?stage=' + stage + '&data=' + data
			}).done(function(msg) {
				if (msg.result == "Success") {
					$(".wizard-next").html("Done");
					var nextStage = $('div[data-step="' + (parseInt(currentStep) + 1) + '"]');
					if (nextStage.length == 0) return;
					$($($(sThis).parents()[2])).fadeOut(1000, function() {
						$(nextStage).fadeIn(1000);
						changeButton();
					});
				} else {
					changeButton();
				}
			});
		}
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

	$(document).on("click", "div[data-step='5'] .wizard-next", function() {
		generateRooms();
	});

	$("input[name='keyword']").keypress(function (e) {
		if (e.which == 13) {
			var text = $("input[name='keyword']").val();
			if (text.trim() == "") return;
			$("#wizard-keywords-field").append("<div class=\"keyword\">" + text + "</div>")
			$("input[name='keyword']").val("");
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
		var currentTab = $(".wizard-room-list-selected").find("span").text();
		var roomIndex = getRoomIndex(currentTab);
		rooms.rooms[roomIndex]["title"] = $("input[name='roomtitle']").val();
		rooms.rooms[roomIndex]["length"] = $("input[name='roomlength']").val();
		rooms.rooms[roomIndex]["width"] = $("input[name='roomwidth']").val();
		rooms.rooms[roomIndex]["units"] = $(".wizard-room-selected").text().trim();
		rooms.rooms[roomIndex]["description"] = $("#wizard-room-description textarea").val();

		$(".wizard-room-tab input, .wizard-room-tab textarea").val("");

		var nextRoomTab = $(this).find("span").text();
		var nextRoomIndex = getRoomIndex(nextRoomTab);
		$("input[name='roomtitle']").val(rooms.rooms[nextRoomIndex]["title"])
		$("input[name='roomlength']").val(rooms.rooms[nextRoomIndex]["length"]);
		$("input[name='roomwidth']").val(rooms.rooms[nextRoomIndex]["width"]);
		$("#wizard-room-description textarea").val(rooms.rooms[nextRoomIndex]["description"]);

		if (rooms.rooms[nextRoomIndex]["units"].toLowerCase() == "metres") selectMetres($("#wizard-room-meters"));
		else selectFeet($("#wizard-room-feet"));
		
		$(".wizard-room-list-selected").removeClass("wizard-room-list-selected");
		$(this).addClass("wizard-room-list-selected");
	});

	$(document).on("click", "#wizard-room-meters", function() {
		selectMetres(this);
	});

	$(document).on("click", "#wizard-room-feet", function() {
		selectFeet(this);
	});
});

function selectMetres(metres) {
	$("#wizard-room-feet").removeClass("wizard-room-selected");
	$(metres).addClass("wizard-room-selected");
}

function selectFeet(feet) {
	$("#wizard-room-meters").removeClass("wizard-room-selected");
	$(feet).addClass("wizard-room-selected");
}

function changeButton() {
	if ($(".wizard-next").css("padding") == "12px 47px") {
		$(".wizard-next").html("Continue <i class=\"fa fa-long-arrow-right\"></i>");
		$(".wizard-next").css("padding", "18px 47px");
		$(".wizard-next").css("width", "200px");
	} else {
		$(".wizard-next").css("padding", "12px 47px");
		$(".wizard-next").animate({
			width: "123px"
		}, 600);
		$(".wizard-next").html("<i class=\"fa fa-spinner fa-pulse fa-2x\"></i>");
	}
}

function generateRooms() {
	var bedrooms = parseInt($("select[name='bedrooms']").val());
	var bathrooms = parseInt($("select[name='bathrooms']").val());
	var receptions = parseInt($("select[name='receptionrooms']").val());
	var other = parseInt($("select[name='otherrooms']").val());

	for (var i = 0; i < bedrooms; i++) {
		$(".wizard-room-list").append("<div><span>Bedroom " + (i + 1) + "</span></div>");
		rooms.rooms.push({ "name": "Bedroom " + (i + 1), "title": "Bedroom " + (i + 1), "length": "", "width": "", "units": "metres", "description": "" })
	}

	for (var i = 0; i < receptions; i++) {
		$(".wizard-room-list").append("<div><span>Reception " + (i + 1) + "</span></div>");
		rooms.rooms.push({ "name": "Reception " + (i + 1), "title": "Reception " + (i + 1), "length": "", "width": "", "units": "metres", "description": "" })
	}

	for (var i = 0; i < bathrooms; i++) {
		$(".wizard-room-list").append("<div><span>Bathroom " + (i + 1) + "</span></div>");
		rooms.rooms.push({ "name": "Bathroom " + (i + 1), "title": "Bathroom " + (i + 1), "length": "", "width": "", "units": "metres", "description": "" })
	}

	for (var i = 0; i < other; i++) {
		$(".wizard-room-list").append("<div><span>Other " + (i + 1) + "</span></div>");
		rooms.rooms.push({ "name": "Other " + (i + 1), "title": "Other " + (i + 1), "length": "", "width": "", "units": "metres", "description": "" })
	}

	$($(".wizard-room-list").children()[0]).addClass("wizard-room-list-selected");
	$("input[name='roomtitle']").val(rooms.rooms[0]["title"])
}

function getRoomIndex(roomTitle) {
	for (var i = 0; i < rooms.rooms.length; i++) {
		if (rooms.rooms[i]["name"] == roomTitle) return i;
	}
	return -1;
}

function stage1() {
	return JSON.stringify({"data": { "first_name": $("input[name='fname']").val(), "last_name": $("input[name='lname']").val(), "email": $("input[name='email']").val(), "phone_number": $("input[name='phone']").val() }})
}

function stage2() {
	return JSON.stringify({"data":{"house_name_number": $("input[name='housenamenumber']").val(), "address_line_1": $("input[name='addressline1']").val(), "address_line_2": $("input[name='addressline2']").val(), "city": $("input[name='city']").val(), "county": $("input[name='county']").val(), "postcode": $("input[name='postcode']").val()}})
}


function stage3() {
	return JSON.stringify({"data": { "property_type": $("select[name='propertytype']").val(), "number_of_floors": $("select[name='numberoffloors']").val(), "entrance_floor": $("select[name='entrancefloor']").val(), "condition": $("select[name='condition']").val(), "number_of_bedrooms": $("select[name='bedrooms']").val(), "number_of_bathroom": $("select[name='bathrooms']").val(), "number_of_receptions": $("select[name='receptionrooms']").val(), "number_of_other_rooms": $("select[name='otherrooms']").val(), "price": $("input[name='price']").val() }})
}

function stage4() {
	var gardens = "";
	$("div[data-step='3']").find(".wizard-content-checkbox-selected-span").each(function(i, e) {
		gardens += $(e).text() + ",";
	});
	return JSON.stringify({ "data": { "gardens": gardens.substring(0, gardens.length - 1) }})
}

function stage5() {
	var parking = "";
	$("div[data-step='4']").find(".wizard-content-checkbox-selected-span").each(function(i, e) {
		parking += $(e).text() + ",";
	});
	return JSON.stringify({ "data": { "parking": parking.substring(0, parking.length - 1) }})
}

function stage6() {
	var heating = "";
	$("div[data-step='5']").find(".wizard-content-checkbox-selected-span").each(function(i, e) {
		heating += $(e).text() + ",";
	});
	return JSON.stringify({ "data": { "heating": heating.substring(0, heating.length - 1) }})
}

function stage7() {
	var dataArr = [];
	$.each(rooms.rooms, function(i, e) {
		dataArr.push(JSON.stringify({ "data": e }))
	});
	return dataArr;
}

function stage8() {
	var keywords = "";
	$("#wizard-keywords-field .keyword").each(function(e, i) {
		keywords += $(e).text() + ",";
	});
	return JSON.stringify({ "data": { "keywords": keywords.substring(0, keywords.length - 1) } });
}

function stage9() {
	return JSON.stringify({ "data": { "description": $("#wizard-description-description textarea").val().trim() } })
}


//HELPER METHODS FOR TESTING
function goto(step) {
	$(".showing").addClass("hidden");
	$(".showing").removeClass("showing");
	$('div[data-step="' + step + '"]').addClass("showing");
	$('div[data-step="' + step + '"]').removeClass("hidden");
}

function finish() {
	$.ajax({
		url: '/account/listing/' + propertyID + '/save?stage=' + 10 + '&data=' + JSON.stringify({ "data": {  }})
	}).done(function(msg) {
		if (msg.result == "Success") {
			window.location = "/account/active"
		}
	});
}