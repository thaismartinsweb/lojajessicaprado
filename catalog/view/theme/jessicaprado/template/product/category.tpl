<?php echo $header; ?>
<div class="container">
  <div id="body-content">
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
	      <h2><p><span><?php echo $heading_title; ?></span></p></h2>
	      <?php if ($products) { ?>
	      <div class="row">
	        <div class="col-md-2 col-md-offset-4 text-right">
	          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
	        </div>
	        <div class="col-md-3 text-right">
	          <select id="input-sort" class="form-control" onchange="location = this.value;">
	            <?php foreach ($sorts as $sorts) { ?>
		            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
		            	<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
		            <?php } else { ?>
		            	<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
		            <?php } ?>
	            <?php } ?>
	          </select>
	        </div>
	        <div class="col-md-1 text-right">
	          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
	        </div>
	        <div class="col-md-2 text-right">
	          <select id="input-limit" class="form-control" onchange="location = this.value;">
	            <?php foreach ($limits as $limits) { ?>
	            <?php if ($limits['value'] == $limit) { ?>
	            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
	            <?php } else { ?>
	            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
	            <?php } ?>
	            <?php } ?>
	          </select>
	        </div>
	      </div>
	      <br />
	      <div class="row">
			  <?php foreach ($products as $product) { ?>
			  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
			    <div class="product-thumb transition">
			      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
			      <div class="caption">
			        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
			        <p><?php echo $product['description']; ?></p>
			        <?php if ($product['rating']) { ?>
			        <div class="rating">
			          <?php for ($i = 1; $i <= 5; $i++) { ?>
			          <?php if ($product['rating'] < $i) { ?>
			          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
			          <?php } else { ?>
			          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
			          <?php } ?>
			          <?php } ?>
			        </div>
			        <?php } ?>
			        <!-- <div class="prices">
				        <?php if ($product['price']) { ?>
				          <?php if (!$product['special']) { ?>
				          	<p class="price"><?php echo $product['price']; ?></p>
				          <?php } else { ?>
				          	<p class="price">
				          		<span class="price-old"><?php echo $product['price']; ?></span>
				         		<span class="price-new"><?php echo $product['special']; ?></span>
				         	</p>
				          <?php } ?>
				        <?php } ?>
			        </div> -->
			        <div class="buy-button">
						<span class="link"><a href="<?php echo $product['href']; ?>"><i class="fa fa-plus"></i> <?php echo $button_readmore; ?></a></span>
			        	<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
			        </div>
			      </div>
			    </div>
			  </div>
			  <?php } ?>
		  </div>
	      <div class="row">
	        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
	        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
	      </div>
	      <?php } ?>
	      <?php if (!$categories && !$products) { ?>
	      <p><?php echo $text_empty; ?></p>
		      <div class="buttons">
		        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-pink"><?php echo $button_continue; ?></a></div>
		      </div>
	      <?php } ?>
	      <?php echo $content_bottom; ?></div>
	    <?php echo $column_right; ?></div>
    </div>
</div>
<?php echo $footer; ?>
