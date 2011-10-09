var pauseWhenImageOpen = false;
jQuery.noConflict();
jQuery(document).ready(function() {
	jQuery(".gallery > div").easySlider({auto:true});
	jQuery(".fancybox").fancybox({
		onStart		:	function() {
			pauseWhenImageOpen = true;
		},
		onCancel	:	function() {
			pauseWhenImageOpen = false; 
		},
		onComplete	:	function() {
            pauseWhenImageOpen = true;
		},
		onCleanup	:	function() {
            pauseWhenImageOpen = false; 
		},
		onClosed	:	function() {
            pauseWhenImageOpen = false; 
		}
	});
});


jQuery(function(){
	initCufon();
	ieHover('input.submit', 'hover');
	clearInputs();
	if(!jQuery.browser.msie || jQuery.browser.version >= 7) hoverBtn();
})

// initCufon
function initCufon(){
	Cufon.replace(['h2 span', '.download-links li a span'], {
		fontFamily: 'PT Sans'
	});
	Cufon.replace(['h2 strong', '.download-links li a strong', '.info h3', '.subscribe h2'], {
		fontFamily: 'PT Sans Bold'
	});
	Cufon.replace(['.link-holder a.see-more'], {
		fontFamily: 'PT Sans Bold',
		hover: true,
		textShadow: '#1c6483 0 1px'
	});
}

// ieHover
function ieHover(_selector, _class){
	if(_class == null) _class = 'hover';
	if (jQuery.browser.msie && jQuery.browser.version < 7) {
		jQuery(_selector).each(function(){
			jQuery(this).mouseenter(function(){
				jQuery(this).addClass(_class)
			}).mouseleave(function(){
				jQuery(this).removeClass(_class)
			})
		})
	}
}

// clear inputs
function clearInputs(){
	var _filterClass = 'default';
	jQuery('input:text, input:password, textarea').each(function(){
		var _el = jQuery(this);
		var _val = _el.val();
		_el.bind('focus', function(){
			if(this.value == _val && !jQuery(this).hasClass(_filterClass)) this.value = '';
		}).bind('blur', function(){
			if(this.value == '' && !jQuery(this).hasClass(_filterClass)) this.value = _val;
		});
	});
};

// hoverBtn
function hoverBtn(){
	var _defOpacity = 0.85,
		_darkOverOpacity = 1,
		_darkClass = 'dark',
		_lightOverOpacity = 0.7,
		_duration = 200;
	
	jQuery('a.button, .download-links a, a.see-more, .subscribe .submit').each(function(){
		var _this = jQuery(this);
		_this.css({
			opacity: _defOpacity
		});
		_this.mouseenter(function(){
			if(_this.hasClass(_darkClass)) _this.animate({opacity: _darkOverOpacity}, {queue: false, duration: _duration});
			else _this.animate({opacity: _lightOverOpacity}, {queue: false, duration: _duration});
		}).mouseleave(function(){
			_this.animate({opacity: _defOpacity}, {queue: false, duration: _duration});
		})
	})
}
