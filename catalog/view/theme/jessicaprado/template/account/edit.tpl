<?php echo $header; ?>
<div class="container">
	<div id="body-content">
	
	  <ul class="breadcrumb">
	    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
	    	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	    <?php } ?>
	  </ul>
	  
	  <?php if ($error_warning) { ?>
	  	<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
	  <?php } ?>
	  
	  <?php if($success){ ?>
	    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
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
	    
	    <div id="content" class="<?php echo $class; ?>">
	      <?php echo $content_top; ?>
	      <h2><p><span><?php echo $heading_title; ?></span></p></h2>
	      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	        <fieldset>
	        
	          <div class="form-group col-sm-6 required">
	            <label class="control-label" for="input-firstname"><?php echo $entry_firstname; ?> </label>
	              <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
	              <?php if ($error_firstname) { ?>
	              <div class="text-danger"><?php echo $error_firstname; ?></div>
	              <?php } ?>
	          </div>
	          
	          <div class="form-group col-sm-6 required">
	            <label class="control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
	              <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
	              <?php if ($error_lastname) { ?>
	              <div class="text-danger"><?php echo $error_lastname; ?></div>
	              <?php } ?>
	          </div>
	          
	          <div class="form-group col-sm-6 required">
	            <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
	              <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
	              <?php if ($error_email) { ?>
	              <div class="text-danger"><?php echo $error_email; ?></div>
	              <?php } ?>
	          </div>
	          
	          <div class="form-group col-sm-6 required">
	            <label class="control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
	              <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
	              <?php if ($error_telephone) { ?>
	              <div class="text-danger"><?php echo $error_telephone; ?></div>
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
<script type="text/javascript"><!--
	$(document).ready(function(){
		$("#input-telephone").mask("(99) 9999-9999?9", {placeholder: " "});
	});
--></script>
<?php echo $footer; ?>