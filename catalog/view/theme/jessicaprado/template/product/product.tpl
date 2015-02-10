<?php echo $header; ?>
<div class="container">
  <div id="body-content" class="product-page">
	  <ul class="breadcrumb">
	    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
	    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	    <?php } ?>
	  </ul>
	  <div class="row"><?php echo $column_left; ?>
	    <?php if ($column_left && $column_right) { ?>
	    <?php $class = 'col-sm-6'; ?>
	    <?php } elseif ($column_left || $column_right) { ?>
	    <?php $class = 'col-sm-9'; ?>
	    <?php } else { ?>
	    <?php $class = 'col-sm-12'; ?>
	    <?php } ?>
	    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	      <div class="row">
	        <?php if ($column_left && $column_right) { ?>
	        	<?php $class = 'col-sm-6'; ?>
	        <?php } elseif ($column_left || $column_right) { ?>
	        	<?php $class = 'col-sm-6'; ?>
	        <?php } else { ?>
	        	<?php $class = 'col-sm-8'; ?>
	        <?php } ?>
	        <div class="<?php echo $class; ?>">
	        
	          <?php if ($thumb || $images) { ?>
	          <ul class="thumbnails">
	            <?php if ($thumb) { ?>
	            <li class="destaque"><a class="thumbnail" data-lightbox="test" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
	            <?php } ?>
	            <?php if ($images) { ?>
	            <?php foreach ($images as $image) { ?>
	            <li class="image-additional"><a class="thumbnail" data-lightbox="test" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
	            <?php } ?>
	            <?php } ?>
	          </ul>
	          <?php } ?>
	          <ul class="nav nav-tabs">
	            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
	            <?php if ($attribute_groups) { ?>
	            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
	            <?php } ?>
	            <?php if ($review_status) { ?>
	            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
	            <?php } ?>
	          </ul>
	          <div class="tab-content">
	            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
	            <?php if ($attribute_groups) { ?>
	            <div class="tab-pane" id="tab-specification">
	              <table class="table table-bordered">
	                <?php foreach ($attribute_groups as $attribute_group) { ?>
	                <thead>
	                  <tr>
	                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
	                  </tr>
	                </thead>
	                <tbody>
	                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
	                  <tr>
	                    <td><?php echo $attribute['name']; ?></td>
	                    <td><?php echo $attribute['text']; ?></td>
	                  </tr>
	                  <?php } ?>
	                </tbody>
	                <?php } ?>
	              </table>
	            </div>
	            <?php } ?>
	            <?php if ($review_status) { ?>
	            <div class="tab-pane" id="tab-review">
	              <form role="form">
	                <div id="review"></div>
	                <h2><?php echo $text_write; ?></h2>
	                <?php if ($review_guest) { ?>
	                <div class="form-group required">
	                  <div class="col-sm-12">
	                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
	                    <input type="text" name="name" value="" id="input-name" class="form-control" />
	                  </div>
	                </div>
	                <div class="form-group required">
	                  <div class="col-sm-12">
	                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
	                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
	                    <div class="help-block"><?php echo $text_note; ?></div>
	                  </div>
	                </div>
	                <div class="form-group required">
	                  <div class="col-sm-12">
	                    <label class="control-label"><?php echo $entry_rating; ?></label>
	                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
	                    <input type="radio" name="rating" value="1" />
	                    &nbsp;
	                    <input type="radio" name="rating" value="2" />
	                    &nbsp;
	                    <input type="radio" name="rating" value="3" />
	                    &nbsp;
	                    <input type="radio" name="rating" value="4" />
	                    &nbsp;
	                    <input type="radio" name="rating" value="5" />
	                    &nbsp;<?php echo $entry_good; ?></div>
	                </div>
	                <div class="buttons">
	                  <div class="pull-right">
	                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-soft-green"><?php echo $button_continue; ?></button>
	                  </div>
	                </div>
	                <?php } else { ?>
	                <?php echo $text_login; ?>
	                <?php } ?>
	              </form>
	            </div>
	            <?php } ?>
	          </div>
	        </div>
	        <?php if ($column_left && $column_right) { ?>
	        <?php $class = 'col-sm-6'; ?>
	        <?php } elseif ($column_left || $column_right) { ?>
	        <?php $class = 'col-sm-6'; ?>
	        <?php } else { ?>
	        <?php $class = 'col-sm-4'; ?>
	        <?php } ?>
	        <div class="<?php echo $class; ?>">
	        
	          <h1><?php echo $heading_title; ?></h1>
	          
	          <?php if ($review_status) { ?>
		          <div class="rating">
		            <p>
		              <?php for ($i = 1; $i <= 5; $i++) { ?>
			              <?php if ($rating < $i) { ?>
			              	<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
			              <?php } else { ?>
			              	<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
			              <?php } ?>
		              <?php } ?>
		          </div>
	          <?php } ?>
	          
	           <?php if ($tags) { ?>
			      <small><?php echo $text_tags; ?>
			        <?php for ($i = 0; $i < count($tags); $i++) { ?>
				        <?php if ($i < (count($tags) - 1)) { ?>
				        	<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
				        <?php } else { ?>
				        	<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
				        <?php } ?>
			        <?php } ?>
			      </small>
		      <?php } ?>

	          <?php if ($price) { ?>
	         
	            <?php if (!$special) { ?>
		            <p class="price"><span><?php echo $text_for; ?></span> <?php echo $price; ?></p>
	            <?php } else { ?>
	            	 <ul class="list-unstyled">
			            <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
			            <li><h2><?php echo $special; ?></h2></li>
		             </ul>
	            <?php } ?>
	         
	          <?php } ?>
	          <div id="product">
	            <?php if ($options) { ?>
	            <?php foreach ($options as $option) { ?>
	            <?php if ($option['type'] == 'select') { ?>
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
	              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
	                <option value=""><?php echo $text_select; ?></option>
	                <?php foreach ($option['product_option_value'] as $option_value) { ?>
	                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
	                <?php if ($option_value['price']) { ?>
	                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
	                <?php } ?>
	                </option>
	                <?php } ?>
	              </select>
	            </div>
	            <?php } ?>
	            <?php if ($option['type'] == 'radio') { ?>
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label"><?php echo $option['name']; ?></label>
	              <div id="input-option<?php echo $option['product_option_id']; ?>">
	                <?php foreach ($option['product_option_value'] as $option_value) { ?>
	                <div class="radio">
	                  <label>
	                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
	                    <?php echo $option_value['name']; ?>
	                    <?php if ($option_value['price']) { ?>
	                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
	                    <?php } ?>
	                  </label>
	                </div>
	                <?php } ?>
	              </div>
	            </div>
	            <?php } ?>
	            <?php if ($option['type'] == 'checkbox') { ?>
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label"><?php echo $option['name']; ?></label>
	              <div id="input-option<?php echo $option['product_option_id']; ?>">
	                <?php foreach ($option['product_option_value'] as $option_value) { ?>
	                <div class="checkbox">
	                  <label>
	                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
	                    <?php echo $option_value['name']; ?>
	                    <?php if ($option_value['price']) { ?>
	                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
	                    <?php } ?>
	                  </label>
	                </div>
	                <?php } ?>
	              </div>
	            </div>
	            <?php } ?>
	            <?php if ($option['type'] == 'image') { ?>
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label"><?php echo $option['name']; ?></label>
	              <div id="input-option<?php echo $option['product_option_id']; ?>">
	                <?php foreach ($option['product_option_value'] as $option_value) { ?>
	                <div class="radio">
	                  <label>
	                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
	                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
	                    <?php if ($option_value['price']) { ?>
	                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
	                    <?php } ?>
	                  </label>
	                </div>
	                <?php } ?>
	              </div>
	            </div>
	            <?php } ?>
	            <?php if ($option['type'] == 'text') { ?>
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
	              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
	            </div>
	            <?php } ?>
	            <?php if ($option['type'] == 'textarea') { ?>
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
	              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
	            </div>
	            <?php } ?>
	            <?php if ($option['type'] == 'file') { ?>
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label"><?php echo $option['name']; ?></label>
	              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
	              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
	            </div>
	            <?php } ?>
	            <?php if ($option['type'] == 'date') { ?>
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
	              <div class="input-group date">
	                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
	                <span class="input-group-btn">
	                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
	                </span></div>
	            </div>
	            <?php } ?>
	            <?php if ($option['type'] == 'datetime') { ?>
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
	              <div class="input-group datetime">
	                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
	                <span class="input-group-btn">
	                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
	                </span></div>
	            </div>
	            <?php } ?>
	            <?php if ($option['type'] == 'time') { ?>
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
	              <div class="input-group time">
	                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
	                <span class="input-group-btn">
	                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
	                </span></div>
	            </div>
	            <?php } ?>
	            <?php } ?>
	            <?php } ?>
	            <?php if ($recurrings) { ?>
	            <hr>
	            <h3><?php echo $text_payment_recurring ?></h3>
	            <div class="form-group required">
	              <select name="recurring_id" class="form-control">
	                <option value=""><?php echo $text_select; ?></option>
	                <?php foreach ($recurrings as $recurring) { ?>
	                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
	                <?php } ?>
	              </select>
	              <div class="help-block" id="recurring-description"></div>
	            </div>
	            <?php } ?>
              <?php if ($minimum > 1) { ?>
            	<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
              <?php } ?>
              <div class="form-group col-sm-6" style="padding:0;">
              	<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
              	<input type="number" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
              	<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              </div>
              <div class="form-group col-sm-6" style="padding:0 0 0 15px;">
             	<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-soft-green btn-lg btn-block"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
              </div>
              <div class="col-sm-12" style="padding:0 0 0 15px;">
              	  <p>Compartilhe:</p>
				  <a href="#" onclick="
						    window.open(
						      'https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(location.href), 
						      'facebook-share-dialog', 
						      'width=626,height=436'); 
						    return false;">
					  <i class="fa fa-facebook"></i> Facebook
				  </a> &nbsp;
				  <a href="#" onclick="
						    window.open(
						      'http://twitter.com/share?text=<?php echo $heading_title; ?>&url'+encodeURIComponent(location.href)+'&via=thamartins', 
						      'facebook-share-dialog', 
						      'width=626,height=436'); 
						    return false;">
					  <i class="fa fa-twitter"></i> Twitter
				  </a> &nbsp;
				  <a href="#" onclick="
						    window.open(
						      'https://plus.google.com/share?url='+encodeURIComponent(location.href), 
						      'facebook-share-dialog', 
						      'width=626,height=436'); 
						    return false;">
					  <i class="fa fa-google-plus"></i> Google+
				  </a>
				</div>
	          </div>
	        </div>
	      </div>
	      <?php if ($products) { ?>
	      <h3><?php echo $text_related; ?></h3>
	      <div class="row">
	        <?php $i = 0; ?>
	        <?php foreach ($products as $product) { ?>
	        <div class="col-sm-2">
	          <div class="product-thumb transition">
	            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a></div>
	            <div class="caption">
	              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
	              <p><?php echo $product['description']; ?></p>
	            </div>
	            <div class="button-group">
	              <!-- <span class="link"><a href="<?php echo $product['href']; ?>"><i class="fa fa-plus"></i> <?php echo $button_readmore; ?></a></span> -->
			      <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
	            </div>
	          </div>
	        </div>
	        <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
	        <div class="clearfix visible-md visible-sm"></div>
	        <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
	        <div class="clearfix visible-md"></div>
	        <?php } elseif ($i % 4 == 0) { ?>
	        <div class="clearfix visible-md"></div>
	        <?php } ?>
	        <?php $i++; ?>
	        <?php } ?>
	      </div>
	      <?php } ?>
	      <?php echo $content_bottom; ?></div>
	    <?php echo $column_right; ?></div>
	</div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				$('#cart-total').html(json['total']);

				$('#cart-number').html(json['total_itens']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
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
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$(node).parent().find('input').attr('value', json['code']);
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
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : ''),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
			$('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
			$('input[name=\'captcha\']').val('');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<?php echo $footer; ?>
