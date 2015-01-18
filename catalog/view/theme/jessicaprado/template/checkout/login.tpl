<div class="row">

	<div class="col-sm-6">
		<h2><?php echo $text_new_customer; ?></h2>
		<p style="margin:30px 0;display:block;"><?php echo $text_register_account; ?></p>
		<input type="button" value="<?php echo $button_continue; ?>" id="button-account" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-pink" />
	</div>
	
	<div class="col-sm-6">
		<h2><?php echo $text_returning_customer; ?></h2>
	
		<div class="form-group">
			<label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
			<input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
		</div>
	
		<div class="form-group">
			<label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
			<input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
			<a href="<?php echo $forgotten; ?>" style="margin:10px 0;display: block;text-align:right"><?php echo $text_forgotten; ?></a>
		</div>
	
		<input type="button" value="<?php echo $button_continue; ?>" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-pink" />
	</div>
	
</div>