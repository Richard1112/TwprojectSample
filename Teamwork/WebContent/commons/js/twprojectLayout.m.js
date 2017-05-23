

/* touch events Swipe*/

$.fn.swipe = function (opt) {
	var defaults = {
		time: 600,
		diff: 100,
		swipeLeft: function () {
		},
		swipeRight: function () {
		}
	};
	$.extend(defaults, opt);
	return this.each(function () {
		this.swipe = {s: [0, 0], e: [0, 0]};

		var mobile = (/(Mobile)/i).test(navigator.userAgent);
		this.addEventListener(mobile ? 'touchstart' : 'mousedown', function (event) {
			var touch = mobile ? event.touches[0] : event;
			this.swipe.s[0] = touch.pageX;
			this.swipe.s[1] = touch.pageY + document.body.scrollTop;
		}, false);
		this.addEventListener(mobile ? 'touchend' : 'mouseup', function (event) {
			var touch = mobile ? event.changedTouches[0] : event;
			this.swipe.e[0] = touch.pageX;
			this.swipe.e[1] = touch.pageY + document.body.scrollTop;
			if (Math.abs(this.swipe.e[1] - this.swipe.s[1]) < defaults.diff / 3)
				if (this.swipe.e[0] > this.swipe.s[0] + defaults.diff) {
					defaults.swipeRight(this, event);
				} else if (this.swipe.e[0] < this.swipe.s[0] - defaults.diff) {
					defaults.swipeLeft(this, event);
				}
		}, false);
	});
};

