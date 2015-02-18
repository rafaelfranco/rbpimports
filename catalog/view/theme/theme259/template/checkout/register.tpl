<script>
  jQuery(document).ready(function($) {
  
  $('input[name=postcode]').attr('maxlength',9);
  
  $('input[name=postcode]').mask("99999-999");
  $('input[name=tax_id]').mask("999.999.999-99");
  $('input[name=tax_id]').attr('maxlength',14);


  $('input[name=postcode]').change(function() {
    preencheEndereco($(this).val());
  });

  $('input[name=tax_id]').change(function() {
    valida_cpf($('input[name=tax_id]').attr('value'));
  });
});
</script>
<div class="headstep">
  <span class="current-step">ENDEREÇO</span> >> 
    <span class="next-step">ENTREGA</span> >> 
    <span class="next-step">PAGAMENTO</span> >> 
    <span class="next-step">FINALIZAÇÃO</span>
</div>

<div class="left-signup">
  <h2><?php echo $text_your_details; ?></h2>
  <span class="required">*</span> <?php echo $entry_firstname; ?><br />
  <input type="text" name="firstname" value="" class="large-field" />
  <br />
  <br />
  <span class="required">*</span> <?php echo $entry_lastname; ?><br />
  <input type="text" name="lastname" value="" class="large-field" />
  <br />
  <br />
  <span class="required">*</span> <?php echo $entry_email; ?><br />
  <input type="text" name="email" value="" class="large-field" />
  <br />
  <br />
  <span id="tax-id-required" class="required">*</span> CPF:<br />
  <input type="text" name="tax_id" value="" class="large-field" />
  <br />
  <br />
  <span class="required">*</span> <?php echo $entry_telephone; ?><br />
  <input type="text" name="telephone" value="" class="large-field" />
  <br />
  <br />
  <?php echo $entry_fax; ?><br />
  <input type="text" name="fax" value="" class="large-field" />
  <br />
  <br />
  
  <span class="required">*</span> <?php echo $entry_password; ?><br />
  <input type="password" name="password" value="" class="large-field" />
  <br />
  <br />
  <span class="required">*</span> <?php echo $entry_confirm; ?> <br />
  <input type="password" name="confirm" value="" class="large-field" />
  <br />
  <br />
  <br />
</div>
<div class="right-signup">
  <h2><?php echo $text_your_address; ?></h2>
 
<span id="payment-postcode-required" class="required">*</span> <?php echo $entry_postcode; ?><br />
<input type="text" name="postcode" value="<?php echo $postcode; ?>" class="large-field" /> <br />
<br />

  <div class="hidden">
  <?php echo $entry_company; ?><br />
  <input type="text" name="company" value="" class="large-field" />
  </div>
  
  <div style="display: <?php echo (count($customer_groups) > 1 ? 'table-row' : 'none'); ?>;">
  <?php echo $entry_customer_group; ?><br />
  <?php foreach ($customer_groups as $customer_group) { ?>
  <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
  <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
  <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
  <br />
  <?php } else { ?>
  <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" />
  <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
  <br />
  <?php } ?>
  <?php } ?>
  <br />
</div>

<div id="company-id-display" class="hidden"><span id="company-id-required" class="required">*</span> <?php echo $entry_company_id; ?><br />
  <input type="text" name="company_id" value="" class="large-field" />
  <br />
  <br />
</div>

<span class="required">*</span> <?php echo $entry_address_1; ?><br />
<input type="text" name="address_1" value="" class="large-field" />
<br />
<br />
  <span class="required">*</span> Numero<br>
    <input type="text" name="numero" value="" class="large-field">
    <br><br>

   Complemento<br>
  <input type="text" name="complemento" value="" class="large-field">
  <br><br>
<?php echo $entry_address_2; ?><br />
<input type="text" name="address_2" value="" class="large-field" />
<br />
<br />
<span class="required">*</span> <?php echo $entry_city; ?><br />
<input type="text" name="city" value="" class="large-field" />

<div class="hidden">
<span class="required">*</span> <?php echo $entry_country; ?><br />
<select name="country_id" class="large-field">
  <option value=""><?php echo $text_select; ?></option>
  <?php foreach ($countries as $country) { ?>
  <?php if ($country['country_id'] == $country_id) { ?>
  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
  <?php } else { ?>
  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
  <?php } ?>
  <?php } ?>
</select>
</div>
<br />
<br />
<span class="required">*</span> <?php echo $entry_zone; ?><br />
<select name="zone_id" class="large-field"><option value=""> --- Selecione --- </option><option value="440">Acre</option><option value="441">Alagoas</option><option value="442">Amapá</option><option value="443">Amazonas</option><option value="444">Bahia</option><option value="445">Ceará</option><option value="446">Distrito Federal</option><option value="447">Espírito Santo</option><option value="448">Goiás</option><option value="449">Maranhão</option><option value="450">Mato Grosso</option><option value="451">Mato Grosso do Sul</option><option value="452">Minas Gerais</option><option value="453">Pará</option><option value="454">Paraíba</option><option value="455">Paraná</option><option value="456">Pernambuco</option><option value="457">Piauí</option><option value="458">Rio de Janeiro</option><option value="459">Rio Grande do Norte</option><option value="460">Rio Grande do Sul</option><option value="461">Rondônia</option><option value="462">Roraima</option><option value="463">Santa Catarina</option><option value="464" selected="selected">São Paulo</option><option value="465">Sergipe</option><option value="466">Tocantins</option></select>
<br />
<br />
<br />
</div>
<div class="hidden">
  <label for="newsletter">
  <input class="checkbox" type="checkbox" checked="checked" name="newsletter" value="1" id="newsletter" />
  <?php echo $entry_newsletter; ?></label>
  <br />
  <?php if ($shipping_required) { ?>
  <input type="checkbox" name="shipping_address" value="1" id="shipping" checked="checked" />
  <label for="shipping"><?php echo $entry_shipping; ?></label>
  
  <?php } ?>

</div>
<?php if ($text_agree) { ?>
<div class="buttons hidden">
  <div><label class="checkbox">
    <?php echo $text_agree; ?>
    <input type="checkbox" checked="checked" name="agree" value="1" />
    </label>
  </div>
</div>
 <a id="button-register" class="button"><span>Realizar Cadastro</span></a>
<?php } else { ?>
<div class="buttons">
  <div class="right">
    <a id="button-register" class="button"><span><?php echo $button_continue; ?></span></a>
  </div>
</div>
<?php } ?>
<script type="text/javascript"><!--
$('#payment-address input[name=\'customer_group_id\']:checked').live('change', function() {
	var customer_group = [];
	
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>	

	if (customer_group[this.value]) {
		if (customer_group[this.value]['company_id_display'] == '1') {
			$('#company-id-display').show();
		} else {
			$('#company-id-display').hide();
		}
		
		if (customer_group[this.value]['company_id_required'] == '1') {
			$('#company-id-required').show();
		} else {
			$('#company-id-required').hide();
		}
		
		if (customer_group[this.value]['tax_id_display'] == '1') {
			$('#tax-id-display').show();
		} else {
			$('#tax-id-display').hide();
		}
		
		if (customer_group[this.value]['tax_id_required'] == '1') {
			$('#tax-id-required').show();
		} else {
			$('#tax-id-required').hide();
		}	
	}
});

$('#payment-address input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('#payment-address select[name=\'country_id\']').bind('change', function() {
    if (this.value == '') return;
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#payment-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/theme259/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#payment-postcode-required').show();
			} else {
				$('#payment-postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {

				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('#payment-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#payment-address select[name=\'country_id\']').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	width: 640,
	height: 480
});
//--></script> 
<style>
  .left-signup {
    width: 49%;
    display: inline-block;
    vertical-align: top;
  }
  .right-signup {
    width: 49%;
    display: inline-block;
    vertical-align: top;
  }
.left-signup input{
  width: 90%;
}
.right-signup input{
  width: 90%;
}
</style>