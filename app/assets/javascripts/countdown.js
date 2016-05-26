function get_remaining_time() {
			var curr_date = new Date();
			var next_date = new Date();

			next_date.setHours(23);
			next_date.setMinutes(59);
			next_date.setSeconds(59);
			next_date.setMilliseconds(0);
			return (next_date - curr_date)/1000;
}


		$(document).ready(function() {
			var clock;

			clock = $('.clock').FlipClock({
		        clockFace: 'HourlyCounter',
		        autoStart: true,
		        callbacks: {
		        	stop: function() {
		        	    clock.setTime(get_remaining_time());
		        		clock.start();
		        	}
		        }
		    });

		    clock.setTime(get_remaining_time());
		    clock.setCountdown(true);
		    clock.start();

		});
