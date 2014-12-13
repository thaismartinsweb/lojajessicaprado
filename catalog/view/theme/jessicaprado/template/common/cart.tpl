<div id="cart" class="btn-group btn-block">
  <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-transparent btn-block btn-lg dropdown-toggle">
  	<img src="catalog/view/theme/jessicaprado/image/cart.png" alt="Carrinho" title="Carrinho" />
  	<span id="cart-number"><?php echo $text_items_number; ?></span>
  	<span id="cart-total"><?php echo $text_items; ?></span>
  </button>
  <ul class="dropdown-menu pull-right">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center">
            <?php if ($product['thumb']) { ?>
           		<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?>
          </td>
          <td class="text-left">
            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            
            <?php if ($product['option']) { ?>
	            <?php foreach ($product['option'] as $option) { ?>
	            <br /><small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
	            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            	<br /><small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?>
            <br /><span class="total-item"><?php echo $product['quantity']; ?>x <?php echo $product['total']; ?></span>
          </td>
          <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-transparent btn-sm"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-transparent btn-sm"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <p class="button"><a href="<?php echo $cart; ?>"><strong><i class="fa fa-share"></i> <?php echo $text_checkout; ?></strong></a><p>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
