jQuery(document).ready(function ($) {

	madmin.init();

	// make code pretty
	window.prettyPrint && prettyPrint();

	$("#table1").tablesorter({widgets: ['zebra']});

	$('a.help-link').pageslide({
		direction: 'left'
	});

});
