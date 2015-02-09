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
	    
	    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	      <h2><p><span><?php echo $heading_title; ?></span></p></h2>
	      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	        <fieldset>
	        
	          <legend><?php echo $text_password; ?></legend>
	          
	          <div class="form-group col-sm-6 required">
	              <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
	              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
	              <?php if ($error_password) { ?>
	              	<div class="text-danger"><?php echo $error_password; ?></div>
	              <?php } ?>
	          </div>
	          
	          <div class="form-group col-sm-6 required">
	              <label class="control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
	              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
	              <?php if ($error_confirm) { ?>
	              	<div class="text-danger"><?php echo $error_confirm; ?></div>
	              <?php } ?>
	          </div>
	        </fieldset>
	        
	        <div class="buttons clearfix">
	          <div class="pull-right">
	            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-pink" />
	          </div>
	        </div>
	      </form>
	      <?php echo $content_bottom; ?></div>
	    <?php echo $column_right; ?></div>
	</div>
</div>
<?php echo $footer; ?> 