$(document).ready(function() {
    $('#start').click(function() {
	$('.bounce').each(function() {
	    $(this).bounce('start', {
		'minSpeed'	: 1,
		'maxSpeed'	: 10,
		'zone'		: '#zone'
	    });
	});
    });

    $('#stop').click(function() {
	$('.bounce').each(function() {
	    $(this).bounce('stop');
	});
    });
});