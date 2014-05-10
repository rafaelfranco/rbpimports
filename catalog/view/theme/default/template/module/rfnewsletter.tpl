<form id="formnewsletter" style="text-align:center" method="post">
      <?php echo $heading_title; ?>
      <input type="text" class="input" id="name" id="nomeNewletter" value="<?php echo $name; ?>" />
      <input type="text" class="input" id="email" id="emailNewletter" value="<?php echo $email; ?>" />
      <input type="button" class="button-news" value="cadastrar" id="submitNewsletter">
</form>
<script type="text/javascript">
	$(document).ready(function(){
		//clear inputs
		$('#name').click(function(){
			if($(this).val() == '<?php echo $name; ?>') {
				$(this).attr('value','');
			}
		});
		$('#email').click(function(){
			if($(this).val() == '<?php echo $email; ?>') {
				$(this).attr('value','');
			}
		});
		
		//save data
		$('#submitNewsletter').click(function(){
			//validate form
			errors = 0;
			if(($('#name').val() == '') || ($('#name').val() == '<?php echo $name; ?>')) {
				$('#name').css('border','solid red 1px');
				errors++;
			} else {
				$('#name').css('border','0px');
			}
			if(($('#email').val() == '') || ($('#email').val() == '<?php echo $email; ?>')) {
				$('#email').css('border','solid red 1px');
				errors++;
			} else {
				$('#email').css('border','0px');
			}
			//submit data
			if(errors == 0) {
				$.ajax({
					url: '/index.php?route=module/rfnewsletter/save',
					type: 'POST',
					data: { 
						name: $('#name').val(),
						email: $('#email').val()
						},
				    success: function(retorno) {
				    	//show sucess message
				    	$('#formnewsletter').html(retorno);
				    }
				});
			}
		});
	});
</script>