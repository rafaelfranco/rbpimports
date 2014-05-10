<div class="buttons">
<table>
<tr>

<td align="right" id="checkout">
	<input type="button" onclick="checkout(); return false;" value="<?php echo $button_confirm; ?>" id="button-confirm" class="button need_move" />
	<?php echo $this->form; ?>
</td>
</tr>
</table>
</div>
<script type="text/javascript">
	function checkout() {
		document.pagamento.submit();
		$.ajax({
			type: 'GET',   url: 'index.php?route=payment/meucheckout/confirm',
			success: function() {
				location = 'index.php?route=checkout/success';
			}
		});
	};
</script>
<script type="text/javascript"><!--
$('#checkout form').submit(function() {
    $.ajax({
        type: 'GET',
        url: 'index.php?route=payment/meucheckout/confirm',
        success: function(t) {
            location = '<?php echo $continue; ?>'
        }
    });
})
//--></script>
