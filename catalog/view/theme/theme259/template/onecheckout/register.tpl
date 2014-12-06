<div id="reg-cpanle" class="divclear">
  
  <div class="left">
  	<span class="required">*</span> <?php echo $entry_password; ?><br />
  	<input type="password" name="password" value="" class="small-field" /><br />
  </div>
  <div class="right">
  	<span class="required">*</span> <?php echo $entry_confirm; ?> <br />
  	<input type="password" name="confirm" value="" class="small-field" /><br />
  </div>
  <div style="clear: both; padding-top: 15px; border-top: 1px solid #EEEEEE;">
  <input style="margin:0px;" type="checkbox" name="newsletter" value="1" id="newsletter"<?php if ($this->config->get('onecheckout_check_newsletter')) { ?> checked="checked"<?php } ?> />
  <?php echo $entry_newsletter; ?>
  <br /><br />
 
  </div>
<?php if ($text_agree) { ?>
<div class="buttons">  
    <input style="margin:0px;" type="checkbox" name="agree" value="1" /> <?php echo $text_agree; ?>
</div>
<?php } ?>

<div style="margin-left: 400px;
margin-top: -40px;"><a id="button-confirmorder" class="button"><span>Cadastrar</span></a></div>


<script type="text/javascript"><!--
$('.colorbox').colorbox({
	width: 640,
	height: 480
});

$('#payment-address input[name=\'password\']').live('blur', function() {
	valiform("payment","password","");
});

$('#payment-address input[name=\'password\']').live('focus', function() {
	errorremove("payment","password");
});

$('#payment-address input[name=\'confirm\']').live('blur', function() {
	valiform("payment","confirm",", #payment-address input[name=\'password\']");
});

$('#payment-address input[name=\'confirm\']').live('focus', function() {
	errorremove("payment","confirm");
});
//--></script> 
</div>