<?php echo $header; ?>
<div class="container">
  <div id="body-content" class="cart">
  
	  <ul class="breadcrumb">
	    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
	   		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	    <?php } ?>
	  </ul>
	  
	  <?php if ($attention) { ?>
		  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
		    <button type="button" class="close" data-dismiss="alert">&times;</button>
		  </div>
	  <?php } ?>
	  
	  <?php if ($success) { ?>
		  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
		    <button type="button" class="close" data-dismiss="alert">&times;</button>
		  </div>
	  <?php } ?>
	  
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
	      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	        <div class="table-responsive">
	          <table class="table table-striped">
	            <thead>
	              <tr>
	                <td class="text-center"><?php echo $column_image; ?></td>
	                <td class="text-left"><?php echo $column_name; ?></td>
	                <td class="text-left"><?php echo $column_quantity; ?></td>
	                <td class="text-right"><?php echo $column_price; ?></td>
	                <td class="text-right"><?php echo $column_total; ?></td>
	              </tr>
	            </thead>
	            <tbody>
	              <?php foreach ($products as $product) { ?>
	              <tr>
	                <td class="text-center">
	                	<?php if ($product['thumb']) { ?>
	                  	<a href="<?php echo $product['href']; ?>">
	                  		<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" />
	                  	</a>
	                  	<?php } ?>
	                </td>
	                <td class="text-left">
	               		<a href="<?php echo $product['href']; ?>">
							<?php echo $product['name']; ?>
						</a>
						<?php if (!$product['stock']) { ?>
								<span class="text-danger">***</span>
							<?php } ?>
                  
						<?php if ($product['option']) { ?>
							<?php foreach ($product['option'] as $option) { ?>
								<br /><small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
							<?php } ?>
						<?php } ?>
	                </td>
	                <td class="text-left">
	                	<div class="input-group btn-block" style="max-width: 200px;">
	                   		<input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
	                    	<span class="input-group-btn">
	                    		<button type="submit" style="font-size:13px" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-pink"><i class="fa fa-refresh"></i></button>
	                    		<button type="button" style="font-size:13px" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-pink" onclick="cart.remove('<?php echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button>
	                    	</span>
	                    </div>
	                </td>
	                <td class="text-right"><?php echo $product['price']; ?></td>
	                <td class="text-right"><?php echo $product['total']; ?></td>
	              </tr>
	              <?php } ?>
	              </tbody>
	              <tfoot>
					<?php if ($shipping) { ?>
						<tr><td style="padding-top:50px;" colspan="5"><?php echo $shipping; ?></td></tr>
					<?php } ?>
		            <?php foreach ($totals as $total) { ?>
			            <tr>
			              <td colspan="4" class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
			              <td class="text-right"><?php echo $total['text']; ?></td>
			            </tr>
		            <?php } ?>
		         </tfoot>
	          </table>
          </form>
	      <div class="buttons">
	        <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-pink"><?php echo $button_shopping; ?></a></div>
	        <?php if($hasShippingMethod){ ?>
	        	<div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn btn-pink"><?php echo $button_checkout; ?></a></div>
	        <?php } else { ?>
	        	<div class="pull-right"><a href="#" id="btn-checkout" class="btn btn-pink"><?php echo $button_checkout; ?></a></div>
	        <?php } ?>
	      </div>
	      <?php echo $content_bottom; ?></div>
	    <?php echo $column_right; ?></div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
$(document).ready(function(){
	$('#btn-checkout').click(function(){
		alert('<?php echo $text_select_shipping; ?>');
		return false;
	});
});
--></script>
<?php echo $footer; ?> 