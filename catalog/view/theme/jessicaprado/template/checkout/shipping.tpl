<div id="shipping">
	<div class="col-sm-12">
	   <div class="col-sm-offset-8 col-sm-1 form-group required text-right">
			<label class="control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
	   </div>
	   <div class="col-sm-3 form-group">
       <div class="input-group btn-block">
        	<input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
       		<span class="input-group-btn">
	        	<input type="button" style="font-size:13px;" value="<?php echo $button_quote; ?>" id="button-quote" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-pink-sm" />
	        </span>
        </div>
        <p class="text-right" style="clear:both;font-size:12px;line-height:15px;margin-top:10px;">Não sabe seu CEP? <a href="http://www.buscacep.correios.com.br/servicos/dnec/index.do" target="_blank">Clique aqui</a></p>
      </div>
	</div>
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