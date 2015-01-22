<?php echo $header; ?>
<div class="container">
	<div id="body-content">
  
	  <ul class="breadcrumb">
	    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
	    	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	    <?php } ?>
	  </ul>
	  <?php var_dump($error_warning); ?>
	  <?php if ($error_warning) { ?>
	 	<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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
	      <p><?php echo $text_account_already; ?></p>
	      <form action="<?php echo $action; ?>" id="account" method="post" enctype="multipart/form-data">
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
				        <label class="control-label" for="input-account-firstname"><?php echo $entry_firstname; ?></label>
				        <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-account-firstname" class="form-control" />
				      </div>
				      
				      <div class="form-group required col-sm-6">
				        <label class="control-label" for="input-account-lastname"><?php echo $entry_lastname; ?></label>
				        <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-account-lastname" class="form-control" />
				      </div>
				      
				      <div class="form-group required col-sm-6">
				        <label class="control-label" for="input-account-email"><?php echo $entry_email; ?></label>
				        <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-account-email" class="form-control" />
				      </div>
				      
				      <div class="form-group required col-sm-6">
				        <label class="control-label" for="input-account-telephone"><?php echo $entry_telephone; ?></label>
				        <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-account-telephone" class="form-control" />
				      </div>
				   </fieldset>    
				    
				    <fieldset>
				      <legend><?php echo $text_your_password; ?></legend>
				      <div class="form-group required col-sm-6">
				        <label class="control-label" for="input-account-password"><?php echo $entry_password; ?></label>
				        <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-account-password" class="form-control" />
				      </div>
				      <div class="form-group required col-sm-6">
				        <label class="control-label" for="input-account-confirm"><?php echo $entry_confirm; ?></label>
				        <input type="password" name="confirm" value="" placeholder="<?php echo $entry_confirm; ?>" id="input-account-confirm" class="form-control" />
				      </div>
				    </fieldset>
				    
				  </div>
				  
				  
				  
				  <div class="col-sm-12">
				  
				    <fieldset id="address">
				      <legend><?php echo $text_your_address; ?></legend>
				      
				      <div class="form-group required col-sm-4">
				        <label class="control-label" for="input-account-postcode"><?php echo $entry_postcode; ?></label>
				        <div class="input-group btn-block">
				        	<input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-account-postcode" class="form-control" />
				       		<span class="input-group-btn">
					        	<input type="button" class="btn btn-pink-sm" data-toggle="tooltip" data-original-title="Buscar endereço através do CEP" data-loading-text="Carregando..." id="button-cep" value="<?php echo $search_postcode ?>" />
					        </span>
				        </div>
				      </div>
				      
				      <div class="form-group col-sm-2">
				      	<label class="control-label" for="input-account-postcode">&nbsp;</label>
				      	<p style="font-size:12px">Não sabe seu CEP?<br /><a href="http://www.buscacep.correios.com.br/servicos/dnec/index.do" target="_blank">Clique aqui</a></p>
				      </div>
				      
				      <div class="form-group col-sm-6">
				        <label class="control-label" for="input-account-company"><?php echo $entry_company; ?></label>
				        <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-account-company" class="form-control" />
				      </div>
				      
				      <div class="form-group required col-sm-6" style="clear:both;">
				        <label class="control-label" for="input-account-address"><?php echo $entry_address; ?></label>
				        <input type="text" name="address" value="<?php echo $address; ?>" placeholder="<?php echo $entry_address; ?>" id="input-account-address" class="form-control" />
				      </div>
				      
				      <div class="form-group required col-sm-2">
				        <label class="control-label" for="input-account-number"><?php echo $entry_number; ?></label>
				        <input type="text" name="number" value="<?php echo $number; ?>" placeholder="<?php echo $entry_number; ?>" id="input-account-number" class="form-control" />
				      </div>
				      
				       <div class="form-group col-sm-4">
				        <label class="control-label" for="input-account-complement"><?php echo $entry_complement; ?></label>
				        <input type="text" name="complement" value="<?php echo $complement; ?>" placeholder="<?php echo $entry_complement; ?>" id="input-account-complement" class="form-control" />
				      </div>
				      
				      <div class="form-group required col-sm-6">
				        <label class="control-label" for="input-account-neighborhood"><?php echo $entry_neighborhood; ?></label>
				        <input type="text" name="neighborhood" value="<?php echo $neighborhood; ?>" placeholder="<?php echo $entry_neighborhood; ?>" id="input-account-neighborhood" class="form-control" />
				      </div>
				      
				      <div class="form-group required col-sm-6">
				        <label class="control-label" for="input-account-city"><?php echo $entry_city; ?> <b><i>(<?php echo $text_shipment_delivery ?>)</i></b></label>
				        <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-account-city" class="form-control" />
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
					    <input type="submit" value="<?php echo $button_continue; ?>" id="button-register" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-pink" />
					  </div>
					</div>
				<?php } ?>
	      </form>
	      <?php echo $content_bottom; ?></div>
	    <?php echo $column_right; ?></div>
	</div>
</div>
<?php if (isset($errors)) { ?>
<script type="text/javascript"><!--
$(document).ready(function(){
	<?php foreach($errors as $error => $message){?>
		$('#input-account-<?php echo $error?>').closest('.form-group').addClass('has-error').append('<div class="text-danger"><?php echo $message; ?></div>');
	<?php } ?>
});
--></script>
<?php } ?>		                
<script type="text/javascript"><!--
//Search for CEP
$(document).delegate('#button-cep', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/cep/search',
        type: 'post',
        data: 'postcode=' + encodeURIComponent($('input[name=\'postcode\']').val().replace(/[^0-9]+/g, "")),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-register').button('loading');
        	$('#input-account-address').val('');
        	$('#input-account-neighborhood').val('');
        	$('#input-account-city').val('');
		},  
        complete: function() {
			$('#button-register').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();

            if(json['error']){

            	var element = $('#input-account-postcode');
				
				if ($(element).parent().hasClass('input-group')) {
					$(element).parent().after('<div class="text-danger">' + json['error'] + '</div>');
				} else {
					$(element).after('<div class="text-danger">' + json['error'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
				
            }
            
            if(json['resultado'] == 1){
                $('#input-account-address').val(json['tipo_logradouro'] + ' ' + json['logradouro']);
                $('#input-account-neighborhood').val(json['bairro']);
            	$('#input-account-city').val(json['cidade']);
            }
        }
    });
});
$('#input-account-postcode').mask('99999-999');
$("#input-account-telephone").mask("(99) 9999-9999?9", {placeholder: " "});
//--></script> 

<?php echo $footer; ?>