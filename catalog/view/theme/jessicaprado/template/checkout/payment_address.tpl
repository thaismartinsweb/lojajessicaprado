 <div class="col-sm-12">
  <?php if ($addresses) { ?>
  <div class="radio">
    <label>
      <input type="radio" name="payment_address" value="existing" checked="checked" />
      <?php echo $text_address_existing; ?></label>
  </div>
  <div id="payment-existing">
    <select name="address_id" class="form-control">
      <?php foreach ($addresses as $address) { ?>
	      <?php if ($address['address_id'] == $address_id) { ?>
	      	<option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?> - <?php echo $address['address']; ?>, <?php echo $address['number']; ?> - <?php echo $address['neighborhood']; ?> - <?php echo $address['city']; ?>/<?php echo $address['zone']; ?></option>
	      <?php } else { ?>
	      	<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?> - <?php echo $address['address']; ?>, <?php echo $address['number']; ?> - <?php echo $address['neighborhood']; ?> - <?php echo $address['city']; ?>/<?php echo $address['zone']; ?></option>
	      <?php } ?>
      <?php } ?>
    </select>
  </div>
  <div class="radio">
    <label>
      <input type="radio" name="payment_address" value="new" />
      <?php echo $text_address_new; ?></label>
  </div>
  <?php } ?>
  <br />
  <div id="payment-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
  
    <div class="form-group required col-sm-6">
      <label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
      <input type="text" name="firstname" value="" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname" class="form-control" />
    </div>
    
    <div class="form-group required col-sm-6">
      <label class="control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
      <input type="text" name="lastname" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-payment-lastname" class="form-control" />
    </div>
    
    <div class="form-group required col-sm-4">
        <label class="control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
        <div class="input-group btn-block">
        	<input type="text" name="postcode" value="" placeholder="<?php echo $entry_postcode; ?>" id="input-payment-postcode" class="form-control" />
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
    
    <div class="form-group required col-sm-6">
      <label class="control-label" for="input-payment-address"><?php echo $entry_address; ?></label>
      <input type="text" name="address" value="" placeholder="<?php echo $entry_address; ?>" id="input-payment-address" class="form-control" />
    </div>
    
    <div class="form-group required col-sm-2">
      <label class="control-label" for="input-payment-number"><?php echo $entry_address_number; ?></label>
      <input type="text" name="number" value="" placeholder="<?php echo $entry_address_number; ?>" id="input-payment-number" class="form-control" />
    </div>
    
    <div class="form-group col-sm-4">
      <label class="control-label" for="input-payment-complement"><?php echo $entry_address_complement; ?></label>
      <input type="text" name="complement" value="" placeholder="<?php echo $entry_address_complement; ?>" id="input-payment-complement" class="form-control" />
    </div>
    
    <div class="form-group required col-sm-6">
      <label class="control-label" for="input-payment-neighborhood"><?php echo $entry_neighborhood; ?></label>
      <input type="text" name="neighborhood" value="" placeholder="<?php echo $entry_neighborhood; ?>" id="input-payment-neighborhood" class="form-control" />
    </div>
    
    <div class="form-group required col-sm-6">
      <label class="control-label" for="input-payment-city"><?php echo $entry_city; ?></label>
      <input type="text" name="city" value="" placeholder="<?php echo $entry_city; ?>" id="input-payment-city" class="form-control" />
    </div>

  </div>
  <div class="buttons clearfix">
    <div class="pull-right">
      <input type="hidden" name="country_id" value="30" />
	  <input type="hidden" name="zone_id" value="464" />
      <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-address" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-pink" />
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('input[name=\'payment_address\']').on('change', function() {
	if (this.value == 'new') {
		$('#payment-existing').hide();
		$('#payment-new').show();
		$('input:radio[value=\'new\']').attr('checked', true);
		$('input:radio[value=\'existing\']').removeAttr("checked");
	} else {
		$('#payment-existing').show();
		$('#payment-new').hide();
		$('input:radio[value=\'new\']').removeAttr("checked");
		$('input:radio[value=\'existing\']').attr('checked', true);
	}
});
//--></script>
<script type="text/javascript"><!--
$('#input-payment-postcode').mask('99999-999');
$("#input-payment-telephone").mask("(99) 9999-9999?9", {placeholder: " "});
//--></script>