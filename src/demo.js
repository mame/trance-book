function load_error() {
    alert("failed to show a file");
}

function load_audio(ary, callback) {
    var elem = $("<audio>");
    elem.attr("controls", "controls");
    elem.on("loadeddata", function() {
	callback(elem, 300);
    });
    elem.on("error", load_error);
    elem.attr("src", "data:audio/x-wav;base64," + base64(ary));
    elem[0].load();
}

function load_image(ary, ext, callback) {
    var elem = $("<img>");
    elem.on("load", function() {
	callback(elem, elem[0].width);
    });
    elem.on("error", load_error);
    elem.attr("src", "data:image/" + ext + ";base64," + base64(ary));
}

function load_text(ary, callback) {
    var file_reader = new FileReader();
    file_reader.onload = function(e) {
	var txt = file_reader.result;
	if (txt.match(/\uFFFD/)) {
	    return load_error();
	}
	var elem = $("<pre>");
	elem.addClass("code");
	elem.text(txt);
	callback(elem, 0);
    }
    file_reader.onerror = load_error;
    file_reader.readAsText(new Blob([ary]));
}

function magic_mime(ary, callback) {
    // "\x89PNG\r\n\x1a\n"
    if (ary[0] == 0x89 && ary[1] == 0x50 && ary[2] == 0x4e && ary[3] == 0x47 &&
	ary[4] == 0x0d && ary[5] == 0x0a && ary[6] == 0x1a && ary[7] == 0x0a) {
	return load_image(ary, "png", callback);
    }
    // "GIF8[79]a"
    if (ary[0] == 0x47 && ary[1] == 0x49 && ary[2] == 0x46 && ary[3] == 0x38 &&
	(ary[4] == 0x37 || ary[4] == 0x39) && ary[5] == 0x61) {
	return load_image(ary, "gif", callback);
    }
    // "RIFF"...."WAVE"
    if (ary[0] == 0x52 && ary[1] == 0x49 && ary[2] == 0x46 && ary[3] == 0x46 &&
	ary[8] == 0x57 && ary[9] == 0x41 && ary[10] == 0x56 && ary[11] == 0x45) {
	return load_audio(ary, callback);
    }
    load_text(ary, callback);
}

function base64(src) {
    var tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    var out = "";
    var num = src.length;
    var i = 0, n, b;
    while (1) {
	b = src[i++];
	if(isNaN(b)) return out;
	out += tab[b >> 2];
	n = (b & 0x03) << 4;

	b = src[i++];
	if (isNaN(b)) return out + tab[n] + "==";
	out += tab[n | (b >> 4)];
	n = (b & 0x0f) << 2;

	b = src[i++];
	if (isNaN(b)) return out + tab[n] + "=";
	out += tab[n | (b >> 6)];
	out += tab[(b & 0x3f)];
    }
}

function show_file(path) {
    jor1kgui.fs.ReadFile(path, function(file) {
	if (!file) {
	    alert("not found: " + path);
	    return;
	}
	var ary = new Uint8Array(file.data);
	magic_mime(ary, function(elem, width) {
	    if (width) {
		var padding = 0;
		padding += parseInt($("#show-body").css("padding-left"), 10);
		padding += parseInt($("#show-body").css("padding-right"), 10);
		$("#show-modal-content").innerWidth(width + padding);
	    }
	    else {
		$("#show-modal-content").innerWidth("98%");
	    }
	    $("#show-title").text(path);
	    $("#show-body").empty().append(elem);
	    $("#show-modal").modal("show");
	});
    });
}

var Jor1k = require("Jor1k");
var LinuxTerm = require("LinuxTerm");

var jor1kgui = new Jor1k({
    system: {
	kernelURL: "vmlinux.bin.bz2",
    },
    fs: {
	basefsURL: "base-fs.json",
	extendedfsURL: "extended-fs.json"
    },
    term: new LinuxTerm("tty", 25, 80),
    path: "demo/",
    worker_path: "demo/jor1k-worker-min.js"
});

var path = "";

jor1kgui.message.Register("tty1", function(d) {
    d.forEach(function(c) {
	c &= 0xFF;
	if (c) {
	    path += String.fromCharCode(c & 0xFF);
	}
	else if (path != "") {
	    show_file(path);
	    path = "";
	}
   }.bind(this));
}.bind(this));

function resize() {
    if ($(document.body).hasClass("fullscreen")) {
	var width, height;
	if (window.innerWidth / window.innerHeight > 640 / 400) {
	    height = window.innerHeight;
	    width = 640 * height / 400;
	}
	else {
	    width = window.innerWidth;
	    height = 400 * width / 640;
	}
	var tty = $("#tty");
	tty.width(width);
	tty.height(height);
    }
}
$(window).on("orientationchange resize", resize);

$(document).on("hidden.bs.modal", function(e) {
    jor1kgui.FocusTerm("tty0");
});

// TODO: button position: immediately right to tty

$("#do-help,#do-help-2").on("click", function() {
    $("#help-modal").modal("show");
});

$("#do-fullscreen").on("click", function() {
    if ($(document.body).hasClass("fullscreen")) {
	$(document.body).removeClass("fullscreen");
	$("#do-fullscreen").removeClass("active");
	$("#tty").width("");
	$("#tty").height("");
    }
    else {
	$(document.body).addClass("fullscreen");
	$("#do-fullscreen").addClass("active");
	resize();
    }
    $("#do-fullscreen").blur();
    jor1kgui.FocusTerm("tty0");
});

$("#do-keyboard").on("click", function() {
    if ($("#keyboard").is(":visible")) {
	$("#keyboard").hide();
	$("#do-keyboard").removeClass("active");
    }
    else {
	var pos = $("#tty").offset();
	$("#keyboard").css({ top: 0, left: 0 });
	$("#keyboard").show();
	$("#do-keyboard").addClass("active");
    }
    $("#do-keyboard").blur();
    jor1kgui.FocusTerm("tty0");
});


////////////////////////////////////////////////////////////////////////////

var tab = $("<table/>");
tab.addClass("keyboard table table-bordered table-condensed");
var colspan = $("<colgroup/>");
for (i = 0; i < 60; i++) {
    var col = $("<col/>");
    col.addClass("keyboard");
    colspan.append(col);
}
tab.append(colspan);
var keys = [{}, {}, {}, {}, {}];
keys[0]["00"] = { width:  4, face: "ESC"      , ascii: 27 };
keys[1]["00"] = { width:  6, face: "TAB"      , ascii:  9 };
keys[1]["54"] = { width:  6, face: "DEL"      , code:   8 };
keys[2]["00"] = { width:  7, face: "CTRL"     , code:  17 };
keys[2]["51"] = { width:  9, face: "\u23CE"   , ascii: 13 };
keys[3]["00"] = { width:  9, face: "SHIFT"    , code:  16 };
keys[3]["49"] = { width:  4, fa: "arrow-up"   , code:  38 };
keys[4]["45"] = { width:  4, fa: "arrow-left" , code:  37 };
keys[4]["49"] = { width:  4, fa: "arrow-down" , code:  40 };
keys[4]["53"] = { width:  4, fa: "arrow-right", code:  39 };
keys[4]["00"] = { width: 45, face: ""         , ascii: 32 };
// 112-121: F1-F10
// 36: HOME
// 35: EnD
// 33: Page up
// 34: Page down
// 45: INS
// 46: DEL
for (j = 0; j < 4; j++) {
    for (i = 0; ; i++) {
	var row = [
	    ["1234567890-=\\`", "!@#$%^&*()_+|~"],
	    ["qwertyuiop[]","QWERTYUIOP{}"],
	    ["asdfghjkl;'", "ASDFGHJKL:\""],
	    ["zxcvbnm,./", "ZXCVBNM<>?"],
	][j];
	if (!row[0][i]) break;
	var v = i * 4 + [4, 6, 7, 9][j];
	if (v < 10) v = "0" + v;
	keys[j][v] = { width: 4, face: row[0][i], shift: row[1][i] };
    }
}
for (j = 0; j <= 4; j++) {
    var tr = $("<tr/>"), tr_shift = $("<tr/>"), btn;
    tr_shift.addClass("shift");
    Object.keys(keys[j]).sort().forEach(function(i) {
	[false, true].forEach(function(shift) {
	    var key = keys[j][i];
	    var face = shift && key.shift ? key.shift : key.face;
	    var ctrl_key = face == "CTRL";
	    var shift_key = face == "SHIFT";
	    var td = $("<td/>");
	    if (ctrl_key) {
		td.attr("id", "ctrl-key");
	    }
	    td.attr("colspan", key.width);
	    if (shift_key && shift) {
		td.addClass("locked");
	    }
	    if (key.fa) {
		var ii = $("<i/>");
		ii.addClass("fa fa-" + key.fa);
		td.append(ii);
	    }
	    else {
		td.text(face);
	    }
	    td.append(btn);
	    if (shift_key) {
		td.on("click", function(e) {
		    tab.toggleClass("keyboard-shift");
		});
	    }
	    else {
		td.on("click", function(e) {
		    // TODO: CTRL
		    var e1, e2;
		    if (key.ascii || !key.code) {
			var code = key.ascii || face.charCodeAt(0);
			e1 = { keyCode: 0, charCode: code };
			e2 = { charCode: code };
		    }
		    else {
			e1 = { keyCode: key.code, charCode: 0 };
			e2 = { charCode: 0 };
		    }
		    e1.preventDefault = function() {};
		    e2.preventDefault = function() {};
		    if (ctrl_key) {
			if ($("td#ctrl-key").hasClass("locked")) {
			    jor1kgui.terminput.OnKeyUp(e1);
			}
			else {
			    jor1kgui.terminput.OnKeyDown(e1);
			}
			$("td#ctrl-key").toggleClass("locked");
		    }
		    else {
			jor1kgui.terminput.OnKeyDown(e1);
			jor1kgui.terminput.OnKeyPress(e2);
			jor1kgui.terminput.OnKeyUp(e1);
			if ($("td#ctrl-key").hasClass("locked")) {
			    e1 = { keyCode: 17, charCode: 0 };
			    e1.preventDefault = function() {};
			    jor1kgui.terminput.OnKeyUp(e1);
			    $("td#ctrl-key").removeClass("locked");
			}
		    }
		});
	    }
	    (shift ? tr_shift : tr).append(td);
	});
    });
    tab.append(tr);
    tab.append(tr_shift);
}
$("#keyboard").append(tab);

var offset;
function mousedown(e) {
    offset = { x: e.pageX, y: e.pageY, dragged: false };
}
function mouseup(e) {
    offset = null;
}
function mousemove(e) {
    if (offset) {
	$("#keyboard").css({
	    top:  $("#keyboard").position().top  + e.pageY - offset.y,
	    left: $("#keyboard").position().left + e.pageX - offset.x
	});
	offset = { x: e.pageX, y: e.pageY, dragged: true };
    }
}

tab.mousedown(mousedown);
tab.on("touchstart", function(e) { mousedown(event.changedTouches[0]); });
tab.mouseup(mouseup);
tab.on("touchend", mouseup);
$("body").mousemove(mousemove);
$("body").on("touchmove", function(e) { mousemove(event.changedTouches[0]); });
