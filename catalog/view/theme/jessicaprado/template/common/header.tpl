<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Ubuntu:400,700,300' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Satisfy' rel='stylesheet' type='text/css'>
<link href="catalog/view/theme/jessicaprado/stylesheet/lightbox.css" rel="stylesheet">
<link href="catalog/view/theme/jessicaprado/stylesheet/stylesheet.css?<?php echo md5('css');?>" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<script src="catalog/view/javascript/lightbox.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery.mask.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">
<div id="content-fixed">
<nav id="top">
	<div class="container">
	    <?php echo $currency; ?>
	    <?php echo $language; ?>
	    <div id="top-links" class="nav pull-left hidden-xs">
	      <ul class="list-inline">
	        <li><a href="mailto:<?php echo $email; ?>"><i class="fa fa-envelope"></i><?php echo $email; ?></a></li>
	        <li><i class="fa fa-phone"></i><?php echo $telephone; ?></span></li>
	      </ul>
	    </div>
	    <div id="top-links" class="nav pull-right hidden-xs">
	      <ul class="list-inline">
	        <?php if ($logged) { ?>
	             <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <?php echo $text_account; ?> <span class="caret"></span></a>
	          		<ul class="dropdown-menu dropdown-menu-right">
			            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				       	<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
				   </ul>
		       	</li>
			<?php } else { ?>
				<li><a href="<?php echo $login; ?>"><i class="fa fa-user"></i><?php echo $text_login; ?></a></li>
			<?php } ?>
	      </ul>
	    </div>
	 </div>
</nav>
<header>
   <div class="container">
    <div class="row">
    
      <div class="col-sm-3 col-xs-4">
        <div id="logo">
          <?php if ($logo) { ?>
          	<a href="<?php echo $home; ?>"><img width="180" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          	<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      
     <?php if ($categories) { ?>
	  <nav id="menu" class="col-xs-2 visible-xs-block">
	    <div class="container">
	      <ul>
	        <?php foreach ($categories as $category) { ?>
		        <?php if ($category['children']) { ?>
			        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
			          <div class="dropdown-menu">
			            <div class="dropdown-inner">
			              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
			              <ul class="list-unstyled">
			                <?php foreach ($children as $child) { ?>
			                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
			                <?php } ?>
			              </ul>
			              <?php } ?>
			            </div>
			        </li>
		        <?php } else { ?>
		        	<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
		        <?php } ?>
	        <?php } ?>
	      </ul>
	    </div>
	  </nav>
	<?php } ?>
	<?php if ($pages) { ?>
	  <nav id="menu" class="col-xs-2 visible-xs-block">
    	<div class="container">
	      <ul>
	      	 <li><a href="<?php echo $home; ?>"><?php echo $text_home ?></a></li>
	        <?php foreach ($pages as $page) { ?>
		        <li><a href="<?php echo $page['href']; ?>"><?php echo $page['title']; ?></a></li>
	        <?php } ?>
	        <li><a href="<?php echo $contact; ?>"><?php echo $text_contact ?></a></li>
	      </ul>
       </div>
	  </nav>
	<?php } ?>
      
      <div class="col-sm-5"><?php echo $search; ?>
      </div>
      <div class="col-sm-3 col-sm-offset-1"><?php echo $cart; ?></div>
    </div>
  </div>
</header>
</div>
<div id="bottom-fixed">
	<?php if ($categories) { ?>
	  <nav id="menu" class="navbar">
	    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
	      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
	    </div>
	    <div class="collapse navbar-collapse navbar-ex1-collapse">
	    	<div class="container">
		      <ul class="nav navbar-nav">
		        <?php foreach ($categories as $category) { ?>
			        <?php if ($category['children']) { ?>
				        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
				          <div class="dropdown-menu">
				            <div class="dropdown-inner">
				              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
				              <ul class="list-unstyled">
				                <?php foreach ($children as $child) { ?>
				                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
				                <?php } ?>
				              </ul>
				              <?php } ?>
				            </div>
				        </li>
			        <?php } else { ?>
			        	<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
			        <?php } ?>
		        <?php } ?>
		      </ul>
		    </div>
	    </div>
	  </nav>
	<?php } ?>
	<?php if ($pages) { ?>
	  <nav id="menu" class="navbar">
	    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
	      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
	    </div>
	    <div class="collapse navbar-collapse navbar-ex1-collapse">
	    	<div class="container">
		      <ul class="nav navbar-nav">
		      	 <li><a href="<?php echo $home; ?>"><?php echo $text_home ?></a></li>
		        <?php foreach ($pages as $page) { ?>
			        <li><a href="<?php echo $page['href']; ?>"><?php echo $page['title']; ?></a></li>
		        <?php } ?>
		        <li><a href="<?php echo $contact; ?>"><?php echo $text_contact ?></a></li>
		      </ul>
	       </div>
	    </div>
	  </nav>
	<?php } ?>
</div>
