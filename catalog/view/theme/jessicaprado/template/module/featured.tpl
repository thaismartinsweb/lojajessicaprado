<h2><p><span><?php echo $heading_title; ?></span></p></h2>
<div class="row">
<?php foreach ($products as $product) { ?>
	  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
	    <div class="product-thumb transition">
	      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a></div>
		    <div class="caption">
		        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
		        <p><?php echo $product['description']; ?></p>
	        </div>
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
				<!-- <span class="link"><a href="<?php echo $product['href']; ?>"><i class="fa fa-plus"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_readmore; ?></span></a></span> -->
	        	<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
	        </div>
	      </div>
	    </div>
	  </div>
<?php } ?>
</div>
<script type="text/javascript"><!--
$(document).ready(function(){
	$('.product-thumb > .image').mouseenter(function(){
		$(this).find('img').animate({
					'width' : '140%',
					'height' : '140%',
					'-ms-transform' : 'rotate(20deg)',
					'-webkit-transform' : 'rotate(20deg)',
					'transform' : 'rotate(20deg)'
			}, 'linear');
	});
	$('.product-thumb > .image').mouseleave(function(){
		$(this).find('img').animate({
					'width' : '120%',
					'height' : '120%',
					'-ms-transform' : 'rotate(-20deg)',
					'-webkit-transform' : 'rotate(-20deg)',
					'transform' : 'rotate(-20deg)'
			}, 'linear');
	});
});
--></script>
