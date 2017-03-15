$(document).ready(function()
{
	$(document).on("mouseenter", '.highlightable', function(e) 
	{
		$(e.currentTarget).addClass('highlighted');
	});

	$(document).on('mouseleave', '.highlightable', function(e) 
	{
		$(e.currentTarget).removeClass('highlighted');
	});
})