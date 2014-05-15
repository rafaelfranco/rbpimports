<hr><?php if ($shipping_methods) { ?>

	<div>
		
	</div>

  <?php foreach ($shipping_methods as $shipping_method) { ?>
	<div><b><?php echo $shipping_method['title']; ?></b></div>
  <?php if (!$shipping_method['error']) { ?>
  <?php foreach ($shipping_method['quote'] as $quote) { ?>
  <div class="highlight">
	<label class="radio" for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?>
	  <span for="<?php echo $quote['code']; ?>">: <?php echo $quote['text']; ?></span>
	</label>
	
  </div>
  <?php } ?>
  <?php } else { ?>
  <div>
	<div><div class="error"><?php echo $shipping_method['error']; ?></div></div>
  </div>
  <?php } ?>
  <?php } ?>

<br />
<?php } ?>
