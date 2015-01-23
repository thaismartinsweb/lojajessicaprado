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
	      <h1><?php echo $heading_title; ?></h1>
	      <div style="margin:50px 0;"><?php echo $text_message; ?></div>
	      <div class="buttons">
	        <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-pink"><?php echo $button_continue; ?></a></div>
	      </div>
	      <?php echo $content_bottom; ?></div>
	    <?php echo $column_right; ?></div>
	</div>
</div>
<?php echo $footer; ?>