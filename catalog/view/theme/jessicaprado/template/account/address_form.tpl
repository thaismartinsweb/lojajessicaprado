<?php echo $header; ?>
<div class="container">
	<div id="body-content">
		  <ul class="breadcrumb">
		    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
		   		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		    <?php } ?>
		  </ul>
		  
		  <div class="row">
		  	<?php echo $column_left; ?>
		    
		    <?php if ($column_left && $column_right) { ?>
		    	<?php $class = 'col-sm-6'; ?>
		    <?php } elseif ($column_left || $column_right) { ?>
		    	<?php $class = 'col-sm-9'; ?>
		    <?php } else { ?>
		    	<?php $class = 'col-sm-12'; ?>
		    <?php } ?>
		    
		    <div id="content" class="<?php echo $class; ?>"> <?php echo $content_top; ?>
		      <h2><p><span><?php echo $text_edit_address; ?></span></p></h2>
		      
		      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		        <fieldset>
		        
		          <div class="form-group required col-sm-6">
				      <label class="control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
				      <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
				    </div>
				    
				    <div class="form-group required col-sm-6">
				      <label class="control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
				      <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
				    </div>
				    
				    <div class="form-group required col-sm-4">
				        <label class="control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
				        <div class="input-group btn-block">
				        	<input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
				       		<span class="input-group-btn">
					        	<input type="button" class="btn btn-pink-sm" data-toggle="tooltip" data-original-title="Buscar endereço através do CEP" data-loading-text="Carregando..." id="button-cep" value="<?php echo $search_postcode ?>" />
					        </span>
				        </div>
				      </div>
				      
				      <div class="form-group col-sm-2">
				      	<label class="control-label" for="input-postcode">&nbsp;</label>
				      	<p style="font-size:12px">Não sabe seu CEP?<br /><a href="http://www.buscacep.correios.com.br/servicos/dnec/index.do" target="_blank">Clique aqui</a></p>
				      </div>
				    
				    <div class="form-group col-sm-6">
				      <label class="control-label" for="input-company"><?php echo $entry_company; ?></label>
				      <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control" />
				    </div>
				    
				    <div class="form-group required col-sm-6">
				      <label class="control-label" for="input-address"><?php echo $entry_address; ?></label>
				      <input type="text" name="address" value="<?php echo $address; ?>" placeholder="<?php echo $entry_address; ?>" id="input-address" class="form-control" />
				    </div>
				    
				    <div class="form-group required col-sm-2">
				      <label class="control-label" for="input-number"><?php echo $entry_number; ?></label>
				      <input type="text" name="number" value="<?php echo $number; ?>" placeholder="<?php echo $entry_number; ?>" id="input-number" class="form-control" />
				    </div>
				    
				    <div class="form-group col-sm-4">
				      <label class="control-label" for="input-complement"><?php echo $entry_complement; ?></label>
				      <input type="text" name="complement" value="<?php echo $complement; ?>" placeholder="<?php echo $entry_complement; ?>" id="input-complement" class="form-control" />
				    </div>
				    
				    <div class="form-group required col-sm-6">
				      <label class="control-label" for="input-neighborhood"><?php echo $entry_neighborhood; ?></label>
				      <input type="text" name="neighborhood" value="<?php echo $neighborhood; ?>" placeholder="<?php echo $entry_neighborhood; ?>" id="input-neighborhood" class="form-control" />
				    </div>
				    
				    <div class="form-group required col-sm-6">
				      <label class="control-label" for="input-city"><?php echo $entry_city; ?> <b><i>(Entregas somente na Grande São Paulo)</i></b></label>
				      <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
				    </div>
		         
		        </fieldset>
		        <div class="buttons clearfix">
		          <div class="pull-right">
		            <input type="hidden" name="country_id" value="30" />
	  				<input type="hidden" name="zone_id" value="464" />
		            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-pink" />
		          </div>
		        </div>
		      </form>
		      <?php echo $content_bottom; ?></div>
		    <?php echo $column_right; ?></div>
	</div>
</div>
<script type="text/javascript"><!--
$(document).ready(function(){
	$('.form-group').removeClass('has-error');
	<?php if(isset($errors)){ ?>
		<?php foreach($errors as $error => $value ){ ?>
			<?php if($value != ""){ ?>
				$('#input-<?php echo $error ?>').closest('.form-group').addClass('has-error');
				$('#input-<?php echo $error ?>').closest('.form-group').append('<div class="text-danger"><?php echo $value?></div>');
			<?php } ?>
		<?php } ?>
	<?php } ?>
});
$('#input-postcode').mask('99999-999');
$("#input-telephone").mask("(99) 9999-9999?9", {placeholder: " "});
//Search for CEP
$(document).delegate('#button-cep', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/cep/search',
        type: 'post',
        data: 'postcode=' + encodeURIComponent($('input[name=\'postcode\']').val().replace(/[^0-9]+/g, "")),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-payment-address').button('loading');
        	$('#input-address').val('');
        	$('#input-neighborhood').val('');
        	$('#input-city').val('');
		},  
        complete: function() {
			$('#button-payment-address').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();

            if(json['error']){

            	var element = $('#input-postcode');
				
				if ($(element).parent().hasClass('input-group')) {
					$(element).parent().after('<div class="text-danger">' + json['error'] + '</div>');
				} else {
					$(element).after('<div class="text-danger">' + json['error'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
				
            }
            
            if(json['resultado'] == 1){
                $('#input-address').val(json['tipo_logradouro'] + ' ' + json['logradouro']);
                $('#input-neighborhood').val(json['bairro']);
            	$('#input-city').val(json['cidade']);
            }
        }
    });
});
//--></script>
<?php echo $footer; ?>
