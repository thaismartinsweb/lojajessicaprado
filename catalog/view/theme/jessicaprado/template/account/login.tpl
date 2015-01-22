<?php echo $header; ?>
<div class="container">
  <div id="body-content">
  
	  <ul class="breadcrumb">
	    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
	    	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	    <?php } ?>
	  </ul>
	  
	  <?php if ($success) { ?>
	  	<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
	  <?php } ?>
	  
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
	      <div class="row" style="padding:20px;">
	      
	        <div class="col-sm-6">
	            <h2><?php echo $text_new_customer; ?></h2>
	            <p style="margin:30px 0;display:block;"><?php echo $text_register_account; ?></p>
	            <a href="<?php echo $register; ?>" class="btn btn-pink"><?php echo $button_continue; ?></a>
	        </div>
	        
	        <div class="col-sm-6">
	            <h2><?php echo $text_returning_customer; ?></h2>
	            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	              <div class="form-group">
	                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
	                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
	              </div>
	              
	              <div class="form-group">
	                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
	                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
	                <a href="<?php echo $forgotten; ?>" style="margin:10px 0;display: block;text-align:right"><?php echo $text_forgotten; ?></a>
	              </div>
	              
	              <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-pink" />
	              <?php if ($redirect) { ?>
	              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
	              <?php } ?>
	            </form>
	        </div>
	        
	      </div>
	      <?php echo $content_bottom; ?></div>
	    <?php echo $column_right; ?></div>
	</div>
</div>
<?php echo $footer; ?>