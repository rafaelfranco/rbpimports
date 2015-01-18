<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="headstep">
	<span class="old-step backto1">ENDEREÇO</span> >> 
  	<span class="old-step backto2">ENTREGA</span> >> 
  	<span class="current-step">PAGAMENTO</span> >> 
  	<span class="next-step">FINALIZAÇÃO</span>
</div>
<?php if ($payment_methods) { ?>
<p><?php echo $text_payment_method; ?></p>
<div>
	<?php foreach ($payment_methods as $payment_method) { ?>
	<div class="highlight">
		<label class="radio" for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?>
			<?php if ($payment_method['code'] == $code || !$code) { ?>
			<?php $code = $payment_method['code']; ?>
			<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
			<?php } else { ?>
			<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
			<?php } ?>
		</label>
	</div>
	<?php } ?>
</div>
<br />
<?php } ?>
<div class="hidden">
<label><?php echo $text_comments; ?></label>
<textarea name="comment" rows="8" style="width: 98%;"><?php echo $comment; ?></textarea>
</div>
<?php if ($text_agree) { ?>
<div class="buttons">
	<label class="checkbox">
		<?php echo $text_agree; ?>
		<?php if ($agree) { ?>
		<input type="checkbox" name="agree" value="1" checked="checked" />
		<?php } else { ?>
		<input type="checkbox" name="agree" value="1" />
		<?php } ?>
	</label>
	

	 <a id="button-payment-method" class="button-cont-right fright" ><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="right">
	<a id="button-payment-method" class="button-cont-right fright" ><span style="background-image:none;padding:0px;">Continuar</span><i class="icon-circle-arrow-right"></i></a>
  </div>
</div>
<?php } ?>
<script type="text/javascript"><!--
$('.colorbox').fancybox({
	
	
});
//--></script> 