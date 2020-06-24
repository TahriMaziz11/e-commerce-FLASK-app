$(document).ready(function() {

     $('#btn-rate').onsubmit (function() {

		$.ajax({
			data : {
				
                    UserID :"",
                    ProductID :"",
                    rate : $('#rate').val(),
			},
			type : 'POST',
			url : '/addnote'
		})
		.done(function(data) {

			if (data.error) {
				$('#errorAlert').text(data.error).show();
				$('#successAlert').hide();
			}
			else {
				$('#successAlert').text(data.name).show();
				$('#errorAlert').hide();
			}

		});

		event.preventDefault();

	});



});

  








    







