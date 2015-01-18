<div id="shipping">
	<form class="form-horizontal">			
		<div class="form-group required">
			<label class="col-sm-offset-7 col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
			<div class="col-sm-2">
				<input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
			</div>
			<div class="col-sm-1">
				<input type="button" value="<?php echo $button_quote; ?>" id="button-quote" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-pink" />
			</div>
		</div>
	</form>
</div>
<script type="text/javascript"><!--
$('#input-postcode').mask('99999-999');
$('#button-quote').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/shipping/quote',
		type: 'post',
		data: 'postcode=' + encodeURIComponent($('input[name=\'postcode\']').val().replace(/[^0-9]+/g, "")),
		dataType: 'json',
		beforeSend: function() {
			$('#button-quote').button('loading');
		},
		complete: function() {
			$('#button-quote').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['error']) {
				$('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}

			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});
//--></script>