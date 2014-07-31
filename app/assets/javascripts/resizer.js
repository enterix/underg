function fix_size() {	//докінчити ресайз фона
	docWidth = $(document).width();
	docHeight = $(document).height();
	
	BACKGROUND_WIDTH = 1500;
	BACKGROUND_HEIGHT = 736;
	
	if((BACKGROUND_HEIGHT > docHeight) || (BACKGROUND_WIDTH > docWidth)) {
		$('body').css('background-size', 'auto auto');
	}
	
	if((BACKGROUND_HEIGHT < docHeight) || (BACKGROUND_WIDTH < docWidth)) {
		$('body').css('background-size', '100% 100%');
	}
	
	if(docWidth <= 1280) {
		$('#css-menu').css('margin-left', '0px');
	}
	if(docWidth > 1280) {
		$('#css-menu').css('margin-left', '10%');
	}
	
	if(docWidth <= 900) {
		$('#css-menu ul li').css('float', 'none');
		$('#menu_line').css('background-color', 'transparent');
		$('.css-menu-central').css('border-left', 'none');
	}
	if(docWidth > 900) {
		$('#css-menu ul li').css('float', 'left');
		$('#menu_line').css('background-color', '#303030');
		$('.css-menu-central').css('border-left', '1px solid blue');
	}
}