<div class="row">

  <div class="col-sm-12">
    <fieldset id="account">
    
      <legend><?php echo $text_your_details; ?></legend>
      
      <div class="form-group" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
        <label class="control-label"><?php echo $entry_customer_group; ?></label>
        <?php foreach ($customer_groups as $customer_group) { ?>
        <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
        <div class="radio">
          <label>
            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
            <?php echo $customer_group['name']; ?></label>
        </div>
        <?php } else { ?>
        <div class="radio">
          <label>
            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
            <?php echo $customer_group['name']; ?></label>
        </div>
        <?php } ?>
        <?php } ?>
      </div>
      
      <div class="form-group required col-sm-6">
        <label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
        <input type="text" name="firstname" value="" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname" class="form-control" />
      </div>
      
      <div class="form-group required col-sm-6">
        <label class="control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
        <input type="text" name="lastname" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-payment-lastname" class="form-control" />
      </div>
      
      <div class="form-group required col-sm-6">
        <label class="control-label" for="input-payment-email"><?php echo $entry_email; ?></label>
        <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-payment-email" class="form-control" />
      </div>
      
      <div class="form-group required col-sm-6">
        <label class="control-label" for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
        <input type="text" name="telephone" value="" placeholder="<?php echo $entry_telephone; ?>" id="input-payment-telephone" class="form-control" />
      </div>
   </fieldset>    
    
    <fieldset>
      <legend><?php echo $text_your_password; ?></legend>
      <div class="form-group required col-sm-6">
        <label class="control-label" for="input-payment-password"><?php echo $entry_password; ?></label>
        <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-payment-password" class="form-control" />
      </div>
      <div class="form-group required col-sm-6">
        <label class="control-label" for="input-payment-confirm"><?php echo $entry_confirm; ?></label>
        <input type="password" name="confirm" value="" placeholder="<?php echo $entry_confirm; ?>" id="input-payment-confirm" class="form-control" />
      </div>
    </fieldset>
    
  </div>
  
  
  
  <div class="col-sm-12">
  
    <fieldset id="address">
      <legend><?php echo $text_your_address; ?></legend>
      
      <div class="form-group required col-sm-4">
        <label class="control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
        <div class="input-group btn-block">
        	<input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-payment-postcode" class="form-control" />
       		<span class="input-group-btn">
	        	<input type="button" class="btn btn-pink-sm" data-toggle="tooltip" data-original-title="Buscar endereço através do CEP" data-loading-text="Carregando..." id="button-cep" value="<?php echo $search_postcode ?>" />
	        </span>
        </div>
      </div>
      
      <div class="form-group col-sm-2">
      	<label class="control-label" for="input-payment-postcode">&nbsp;</label>
      	<p style="font-size:12px">Não sabe seu CEP?<br /><a href="http://www.buscacep.correios.com.br/servicos/dnec/index.do" target="_blank">Clique aqui</a></p>
      </div>
      
      <div class="form-group col-sm-6">
        <label class="control-label" for="input-payment-company"><?php echo $entry_company; ?></label>
        <input type="text" name="company" value="" placeholder="<?php echo $entry_company; ?>" id="input-payment-company" class="form-control" />
      </div>
      
      <div class="form-group required col-sm-6" style="clear:both;">
        <label class="control-label" for="input-payment-address"><?php echo $entry_address; ?></label>
        <input type="text" name="address" value="" placeholder="<?php echo $entry_address; ?>" id="input-payment-address" class="form-control" />
      </div>
      
      <div class="form-group required col-sm-2">
        <label class="control-label" for="input-payment-number"><?php echo $entry_number; ?></label>
        <input type="text" name="number" value="" placeholder="<?php echo $entry_number; ?>" id="input-payment-number" class="form-control" />
      </div>
      
       <div class="form-group col-sm-4">
        <label class="control-label" for="input-payment-complement"><?php echo $entry_complement; ?></label>
        <input type="text" name="complement" value="" placeholder="<?php echo $entry_complement; ?>" id="input-payment-complement" class="form-control" />
      </div>
      
      <div class="form-group required col-sm-6">
        <label class="control-label" for="input-payment-neighborhood"><?php echo $entry_neighborhood; ?></label>
        <input type="text" name="neighborhood" value="" placeholder="<?php echo $entry_neighborhood; ?>" id="input-payment-neighborhood" class="form-control" />
      </div>
      
      <div class="form-group required col-sm-6">
        <label class="control-label" for="input-payment-city"><?php echo $entry_city; ?> <b><i>(<?php echo $text_shipment_delivery ?>)</i></b></label>
        <input type="text" name="city" value="" placeholder="<?php echo $entry_city; ?>" id="input-payment-city" class="form-control" />
      </div>
      
      <div class="form-group col-sm-12">
		<input type="hidden" name="country_id" value="30" />
		<input type="hidden" name="zone_id" value="464" />
		<input type="hidden" name="shipping_address" value="1" />

		<div class="checkbox">
			<label for="newsletter">
				<input type="checkbox" name="newsletter" value="1" id="newsletter" checked="checked" />
				<?php echo $entry_newsletter; ?>
			</label>
		</div>
      </div>
      
    </fieldset>
  </div>
</div>

<?php if ($text_agree) { ?>
	<div class="buttons clearfix">
	  <div class="pull-right"><?php echo $text_agree; ?> &nbsp;
	    <input type="checkbox" name="agree" value="1" />
	    <input type="button" value="<?php echo $button_continue; ?>" id="button-register" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-pink" />
	  </div>
	</div>
<?php } else { ?>
	<div class="buttons clearfix">
	  <div class="pull-right">
	    <input type="button" value="<?php echo $button_continue; ?>" id="button-register" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-pink" />
	  </div>
	</div>
<?php } ?>

<script type="text/javascript"><!--


// Sort the custom fields
$('#account .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
		$('#account .form-group').eq($(this).attr('data-sort')).before(this);
	} 
	
	if ($(this).attr('data-sort') > $('#account .form-group').length) {
		$('#account .form-group:last').after(this);
	}
		
	if ($(this).attr('data-sort') < -$('#account .form-group').length) {
		$('#account .form-group:first').before(this);
	}
});

$('#address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#address .form-group').length) {
		$('#address .form-group').eq($(this).attr('data-sort')).before(this);
	} 
	
	if ($(this).attr('data-sort') > $('#address .form-group').length) {
		$('#address .form-group:last').after(this);
	}
		
	if ($(this).attr('data-sort') < -$('#address .form-group').length) {
		$('#address .form-group:first').before(this);
	}
});

$('#collapse-payment-address input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('#collapse-payment-address .custom-field').hide();
			$('#collapse-payment-address .custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('#payment-custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('#payment-custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#collapse-payment-address input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('#collapse-payment-address button[id^=\'button-payment-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
		
			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();
					
					if (json['error']) {
						$(node).parent().find('input[name^=\'custom_field\']').after('<div class="text-danger">' + json['error'] + '</div>');
					}
	
					if (json['success']) {
						alert(json['success']);
	
						$(node).parent().find('input[name^=\'custom_field\']').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 
<script type="text/javascript"><!--
$('#input-payment-postcode').mask('99999-999');
$("#input-payment-telephone").mask("(99) 9999-9999?9", {placeholder: " "});

$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script> 
<script type="text/javascript"><!--
$('#collapse-payment-address select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#collapse-payment-address select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			$('.fa-spin').remove();
			
			if (json['postcode_required'] == '1') {
				$('#collapse-payment-address input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('#collapse-payment-address input[name=\'postcode\']').parent().parent().removeClass('required');
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';
					
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}
					
					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('#collapse-payment-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#collapse-payment-address select[name=\'country_id\']').trigger('change');
//--></script>