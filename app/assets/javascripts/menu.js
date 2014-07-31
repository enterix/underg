var setBackgroundColor = function(value, element) {
	$(element).css('background-color', value);
};

var setTextColor = function(value, element) {
	$(element + ' a').css('color', value);
};

var resizeBlock = function(value, element) {
	$(element).css('width', value);
};

function enableMenuAnimantio(element) {
	var timer = 0;
	var bColor = '30';
	
	$(element).hover(
		function() {
			setTextColor('black', element);
			resizeBlock('12em', element);
			
			clearInterval(timer);
			timer = setInterval(function() {
				if(bColor != 'd0') {
					bColor = hexNumberIncrease(bColor);
				}
				
				setBackgroundColor('#' + bColor + bColor + bColor, element)
				
				if(bColor == 'd0') {
					clearInterval(timer);
				}
			}, 1);
		},
		function() {
			setTextColor('white', element);
			resizeBlock('10em', element);
			
			clearInterval(timer);
			timer = setInterval(function() {
				if(bColor != '30') {
					bColor = hexNumberDecrease(bColor);
				}
				
				setBackgroundColor('#' + bColor + bColor + bColor, element)
				
				if(bColor == '30') {
					clearInterval(timer);
				}
			}, 1);
		}
	);
}

function hexNumberIncrease(number) {
	var first = number.charAt(0);
	var second = number.charAt(1);
	
	if(second == 'f') {
		if(first != 'f') {
			second = '0';
			first = charInc(first);
		}
	}
	else {
		second = charInc(second);
	}
	
	
	function charInc(numb) {
		switch(numb) {
			case '0':
				numb = '1';
			break;
			case '1':
				numb = '2';
			break;
			case '2':
				numb = '3';
			break;
			case '3':
				numb = '4';
			break;
			case '4':
				numb = '5';
			break;
			case '5':
				numb = '6';
			break;
			case '6':
				numb = '7';
			break;
			case '7':
				numb = '8';
			break;
			case '8':
				numb = '9';
			break;
			case '9':
				numb = 'a';
			break;
			case 'a':
				numb = 'b';
			break;
			case 'b':
				numb = 'c';
			break;
			case 'c':
				numb = 'd';
			break;	
			case 'd':
				numb = 'e';
			break;	
			case 'e':
				numb = 'f';
			break;			
		}
		
		return numb;
	}
	
	return first + second;
}

function hexNumberDecrease(number) {
	var first = number.charAt(0);
	var second = number.charAt(1);
	
	if(second == '0') {
		if(first != '0') {
			second = 'f';
			first = charDec(first);
		}
	}
	else {
		second = charDec(second);
	}
	
	
	function charDec(numb) {
		switch(numb) {
			case '1':
				numb = '0';
			break;
			case '2':
				numb = '1';
			break;
			case '3':
				numb = '2';
			break;
			case '4':
				numb = '3';
			break;
			case '5':
				numb = '4';
			break;
			case '6':
				numb = '5';
			break;
			case '7':
				numb = '6';
			break;
			case '8':
				numb = '7';
			break;
			case '9':
				numb = '8';
			break;
			case 'a':
				numb = '9';
			break;
			case 'b':
				numb = 'a';
			break;
			case 'c':
				numb = 'b';
			break;	
			case 'd':
				numb = 'c';
			break;	
			case 'e':
				numb = 'd';
			break;			
			case 'f':
				numb = 'e';
			break;		
		}
		
		return numb;
	}
	
	return first + second;
}