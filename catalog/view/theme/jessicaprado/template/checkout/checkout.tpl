<?php echo $header; ?>

<div class="container">
  <div id="body-content">
  	  <ul class="breadcrumb">
	    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
	   		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	    <?php } ?>
	  </ul>
  
	  <?php if ($error_warning) { ?>
		  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		    <button type="button" class="close" data-dismiss="alert">&times;</button>
		  </div>
	  <?php } ?>
  
  <div class="row">
  	<?php echo $column_left; ?>
  	
    <?php if ($column_left && $column_right) { ?>
    	<?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
   		<?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    	<?php $class = 'col-sm-12'; ?>
    <?php } ?>
    
	<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	    
		<h1><?php echo $heading_title; ?></h1>
		
		<div role="tabpanel" id="tabCheckout">
			<ul class="nav nav-tabs nav-justified" role="tablist">
				<?php if (!$logged && $account != 'guest') { ?>
					<li role="presentation" id="tab-account" class="active"><a href="#account" aria-controls="account" role="tab" data-toggle="tab"><?php echo $text_checkout_option; ?></a></li>
				<?php } ?>
				<li role="presentation" id="tab-address" class="<?php echo ($logged && $account != 'guest') ? 'active' : '' ?>"><a href="#address" aria-controls="address" role="tab" data-toggle="tab"><?php echo $text_checkout_shipping_address; ?></a></li>
				<li role="presentation" id="tab-payment" class="disabled"><a href="#payment" aria-controls="payment" role="tab" data-toggle="tab"><?php echo $text_checkout_payment_method; ?></a></li>
				<li role="presentation" id="tab-confirm" class="disabled"><a href="#confirm" aria-controls="confirm" role="tab" data-toggle="tab"><?php echo $text_checkout_confirm; ?></a></li>
			</ul>
		</div>
      
		<div class="tab-content">
		
			<?php if (!$logged && $account != 'guest') { ?>
				<div role="tabpanel" class="tab-pane fade in active" id="account">
					<div class="panel-body"></div>
				</div>
			<?php } ?>
					
			<div role="tabpanel" class="tab-pane fade <?php echo ($logged && $account != 'guest') ? 'in active' : '' ?>" id="address">
				<div class="panel-body"></div>
			</div>
			        
			<div role="tabpanel" class="tab-pane fade" id="payment">
				<div class="panel-body"></div>
			</div>
					
			<div role="tabpanel" class="tab-pane fade" id="confirm">
				<div class="panel-body"></div>
			</div>
				
		</div>
    </div>
    
	<?php echo $content_bottom; ?>
	<?php echo $column_right; ?>
  </div>
</div>
<script type="text/javascript"><!--

$(document).on('change', 'input[name=\'account\']', function() {
	if ($('.collapse-payment-address').parent().find('.panel-heading .panel-title > *').is('a')) {	
		if (this.value == 'register') {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_account; ?> <i class="fa fa-caret-down"></i></a>');
		} else {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
		}
	} else {
		if (this.value == 'register') {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_account; ?>');
		} else {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_address; ?>');
		}	
	}
});

<?php if (!$logged && $account != 'guest') { ?> 
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/login',
        dataType: 'html',
        success: function(html) {
           $('#account').find('.panel-body').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});    
<?php } else { ?>
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_address',
        dataType: 'html',
        success: function(html) {
            $('#address .panel-body').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
<?php } ?>

$(document).delegate('#button-account', 'click', function() {
	 $.ajax({
        url: 'index.php?route=checkout/register',
        dataType: 'html',
        beforeSend: function() {
        	$('#button-account').button('loading');
		},      
        complete: function() {
			$('#button-account').button('reset');
        },          
        success: function(html) {
            $('.alert, .text-danger').remove();

            $('#account').find('.panel-body').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert("ERROR: " + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

// Login
$(document).delegate('#button-login', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/login/save',
        type: 'post',
        data: $('#account :input'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-login').button('loading');
		},  
        complete: function() {
            $('#button-login').button('reset');
        },              
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');
			
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('#account .panel-body').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
           
				// Highlight any found errors
				$('input[name=\'email\']').parent().addClass('has-error');	
				$('input[name=\'password\']').parent().addClass('has-error');	   
		   }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Register
$(document).delegate('#button-register', 'click', function() {

    $.ajax({
        url: 'index.php?route=checkout/register/save',
        type: 'post',
        data: $('#account input[type=text], #account input[type=hidden], #account input[type=password]').serialize(),
        dataType: 'json',
        beforeSend: function() {
			$('#button-register').button('loading');
		},  
        complete: function() {
            $('#button-register').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');

			if(json['redirect']){
				location: json['redirect'];
			} else if (json['error']) {
                if (json['error']['warning']) {
                    $('#account .panel-body').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
                
				for (i in json['error']) {
					var element = $('#input-payment-' + i.replace('_', '-'));
					
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert("ERROR: " + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Payment Address  
$(document).delegate('#button-payment-address', 'click', function() {
	
		if($('input[name=\'payment_address\']:checked').val() == 'new'){
			var urlPost = 'index.php?route=checkout/payment_address/save';      
		} else {
			var urlPost = 'index.php?route=checkout/payment_address/setAddress';
		}

		$.ajax({
	        url: urlPost,
	        type: 'post',
	        data: $('#address input[type=\'text\'], #address input[type=\'checkbox\']:checked, #address input[type=\'radio\']:checked, #address input[type=\'hidden\'], #address textarea, #address select'),
	        dataType: 'json',
	        beforeSend: function() {
	        	$('#button-payment-address').button('loading');
			},  
	        complete: function() {
				$('#button-payment-address').button('reset');
	        },          
	        success: function(json) {
	            $('.alert, .text-danger').remove();
	            
	            if (json['redirect']) {
	                location = json['redirect'];
	            } else if (json['error']) {
	                if (json['error']['warning']) {
	                    $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
	                }
	                				
					for (i in json['error']) {
						var element = $('#input-payment-' + i.replace('_', '-'));
						
						if ($(element).parent().hasClass('input-group')) {
							$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
						} else {
							$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
						}
					}
									
					// Highlight any found errors
					$('.text-danger').parent().parent().addClass('has-error');				
	            }
	        },
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
	    }); 

		$.ajax({
			url: 'index.php?route=checkout/payment_method',
			dataType: 'html',
			success: function(html) {

				$('li.active').removeClass('active');
                $('#tab-payment').removeClass('disabled').addClass('active');
                $('#address').removeClass('active').removeClass('in');
                $('#payment').addClass('active').addClass('in');
                
                $('#payment .panel-body').html(html);
            	
				$('#payment').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_method; ?> <i class="fa fa-caret-down"></i></a>');

				$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
				
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			 }
		}); 
});

// Search for CEP
$(document).delegate('#button-cep', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/cep/search',
        type: 'post',
        data: 'postcode=' + encodeURIComponent($('input[name=\'postcode\']').val().replace(/[^0-9]+/g, "")),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-payment-address').button('loading');
        	$('#input-payment-address').val('');
        	$('#input-payment-neighborhood').val('');
        	$('#input-payment-city').val('');
		},  
        complete: function() {
			$('#button-payment-address').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();

            if(json['error']){

            	var element = $('#input-payment-postcode');
				
				if ($(element).parent().hasClass('input-group')) {
					$(element).parent().after('<div class="text-danger">' + json['error'] + '</div>');
				} else {
					$(element).after('<div class="text-danger">' + json['error'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
				
            }
            
            if(json['resultado'] == 1){
                $('#input-payment-address').val(json['tipo_logradouro'] + ' ' + json['logradouro']);
                $('#input-payment-neighborhood').val(json['bairro']);
            	$('#input-payment-city').val(json['cidade']);
            }
        }
    });
});

$(document).delegate('#button-payment-method', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_method/save', 
        type: 'post',
        data: $('#payment input[type=\'radio\']:checked, #payment input[type=\'checkbox\']:checked, #payment textarea'),
        dataType: 'json',
        beforeSend: function() {
         	$('#button-payment-method').button('loading');
		},  
        complete: function() {
            $('#button-payment-method').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#payment .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }           
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/confirm',
                    dataType: 'html',
                    success: function(html) {

                    	$('li.active').removeClass('active');
                        $('#tab-confirm').removeClass('disabled').addClass('active');
                        $('#payment').removeClass('active').removeClass('in');
                        $('#confirm').addClass('active').addClass('in');
                        
                        $('#confirm .panel-body').html(html);
  						
						$('#confirm').parent().find('.panel-heading .panel-title').html('<a href="#collapse-checkout-confirm" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_confirm; ?> <i class="fa fa-caret-down"></i></a>');
					},
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }); 
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});
//--></script> 
<?php echo $footer; ?>