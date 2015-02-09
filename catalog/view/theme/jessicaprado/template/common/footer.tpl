<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3 text-center">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          	<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
           <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-4 col-sm-offset-1 text-center">
        <h5><?php echo $text_tags; ?></h5>
          <div id="tags-cloud">
	          <?php if(is_array($tags)) { ?>
		          <?php foreach($tags as $tag ) {?>
		          	<span><a href="<?php echo $tag['href']; ?>"><?php echo $tag['name']; ?></a></span>&nbsp;
		          <?php } ?>
	          <?php } ?>
          </div>
      </div>
      <div class="col-sm-3 col-sm-offset-1 text-center">
        <h5><?php echo $text_contact; ?></h5>
        <ul class="list-unstyled">
          <li><?php echo $telephone; ?></li>
          <li><a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <div class="row powered">
    	<div class="col-md-7"><p><?php echo $powered; ?></p></div>
    	<div class="col-md-5"><p><?php echo $development; ?></p></div>
    </div>
  </div>
  <div class="line"></div>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>