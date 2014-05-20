<script type="text/javascript">jQuery(document).ready(function($) {
	$('input[name=postcode]').change(function() {
		$.ajax({
            url: '/index.php?route=module/cep',
            type: 'POST',
            data: "CEP="+$(this).val(),
            success: function(json) {
            	console.log(json);
				dados = json.split(";");
                $('input[name=address_1]').val(dados[0]);
                $('input[name=address_2]').val(dados[1]);
                $('input[name=city]').val(dados[2]);

                //define state
                switch(dados[3]) {
                    case 'AC' :
                        $('#zone').val(440);
                    break;
                    case 'AL' :
                        $('#zone').val(441);
                    break;
                    case 'AP' :
                        $('#zone').val(442);
                    break;
                    case 'AM' :
                        $('#zone').val(443);
                    break;
                    case 'BA' :
                        $('#zone').val(444);
                    break;
                    case 'CE' :
                        $('#zone').val(445);
                    break;
                    case 'DF' :
                        $('#zone').val(446);
                    break;
                    case 'ES' :
                        $('#zone').val(447);
                    break;
                    case 'GO' :
                        $('#zone').val(448);
                    break;
                    case 'MA' :
                        $('#zone').val(449);
                    break;
                    case 'MT' :
                        $('#zone').val(450);
                    break;
                    case 'MS' :
                        $('#zone').val(451);
                    break;
                    case 'MG' :
                        $('#zone').val(452);
                    break;
                    case 'PA' :
                        $('#zone').val(453);
                    break;
                    case 'PB' :
                        $('#zone').val(454);
                    break;
                    case 'PR' :
                        $('#zone').val(455);
                    break;
                    case 'PE' :
                        $('#zone').val(456);
                    break;
                    case 'PI' :
                        $('#zone').val(457);
                    break;
                    case 'RJ' :
                        $('#zone').val(458);
                    break;
                    case 'RN' :
                        $('#zone').val(459);
                    break;
                    case 'RS' :
                        $('#zone').val(460);
                    break;
                    case 'RO' :
                        $('#zone').val(461);
                    break;
                    case 'RR' :
                        $('#zone').val(462);
                    break;
                    case 'SC' :
                        $('#zone').val(463);
                    break;
                    case 'SP' :
                        $('#zone').val(464);
                    break;
                    case 'SE' :
                        $('#zone').val(465);
                    break;
                    case 'TO' :
                        $('#zone').val(466);
                    break;
                }
             }
        });
	});
});</script><?php if ($addresses) { ?>
<label class="radio" for="payment-address-existing"><?php echo $text_address_existing; ?>
	<input type="radio" name="payment_address" value="existing" id="payment-address-existing" checked="checked" />
</label>
<div id="payment-existing">
  <select name="address_id" style="width: 100%; margin-bottom: 15px;" size="5">
	<?php foreach ($addresses as $address) { ?>
	<?php if ($address['address_id'] == $address_id) { ?>
	<option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
	<?php } else { ?>
	<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
	<?php } ?>
	<?php } ?>
  </select>
</div>
<p>
	<label class="radio" for="payment-address-new"><?php echo $text_address_new; ?>
		<input type="radio" name="payment_address" value="new" id="payment-address-new" />
	</label>
</p>
<?php } ?>
<div id="payment-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
	<div class="form form-horizontal">
		<div class="control-group">
			<label class="control-label" for="firstname"><span class="required">*</span> <?php echo $entry_firstname; ?></label>
			<div class="controls">
				<input type="text" name="firstname" value="" class="large-field" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="lastname"><span class="required">*</span> <?php echo $entry_lastname; ?></label>
			<div class="controls">
				<input type="text" name="lastname" value="" class="large-field" />
			</div>
		</div>
		
		<?php if ($tax_id_display) { ?>
		<div class="control-group">
			<label class="control-label" for="tax_id">
				<?php if ($tax_id_required) { ?>
				<span class="required">*</span>
				<?php } ?>
				<?php echo $entry_tax_id; ?>
			</label>
			<div class="controls">
				<input type="text" name="tax_id" value="" class="large-field" />
			</div>
		</div>
		<?php } ?>
		<div class="control-group">
			<label class="control-label" for="postcode"><span id="payment-postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></label>
			<div class="controls">
				<input type="text" name="postcode" value="" class="large-field" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="address_1"><span class="required">*</span> <?php echo $entry_address_1; ?></label>
			<div class="controls">
				<input type="text" name="address_1" value="" class="large-field" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="address_2"><?php echo $entry_address_2; ?></label>
			<div class="controls">
				<input type="text" name="address_2" value="" class="large-field" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="city"><span class="required">*</span> <?php echo $entry_city; ?></label>
			<div class="controls">
				<input type="text" name="city" value="" class="large-field" />
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="country_id"><span class="required">*</span> <?php echo $entry_country; ?></label>
			<div class="controls">
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
		</div>
		<div class="control-group">
			<label class="control-label" for="address_2"><span class="required">*</span> <?php echo $entry_zone; ?></label>
			<div class="controls">
				<select name="zone_id" id="zone" class="large-field"></select>
			</div>
		</div>
	</div>
</div>
<br />
<div class="buttons">
  <div class="right">
	<a id="button-payment-address" class="button-cont-right fright" ><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a>
  </div>
</div>
<script type="text/javascript"><!--
$('#payment-address input[name=\'payment_address\']').live('change', function() {
	if (this.value == 'new') {
		$('#payment-existing').hide();
		$('#payment-new').show();
	} else {
		$('#payment-existing').show();
		$('#payment-new').hide();
	}
});
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
//--></scri