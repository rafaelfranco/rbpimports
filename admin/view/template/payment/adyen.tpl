<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><?php echo $entry_total; ?></td>
            <td><input type="text" name="adyen_total" value="<?php echo $adyen_total; ?>" /></td>
          </tr> 
		  <tr>
            <td><span class="required">*</span> <?php echo $entry_afiliacao; ?></td>
            <td><input type="text" name="adyen_afiliacao" value="<?php echo $adyen_afiliacao; ?>" />
              <?php if ($error_afiliacao) { ?>
              <span class="error"><?php echo $error_afiliacao; ?></span>
              <?php } ?>
			</td>
          </tr>
		  <tr>
            <td><span class="required">*</span> <?php echo $entry_login; ?></td>
            <td><input type="text" name="adyen_login" value="<?php echo $adyen_login; ?>" />
              <?php if ($error_login) { ?>
              <span class="error"><?php echo $error_login; ?></span>
              <?php } ?>
			</td>
          </tr>
		  <tr>
            <td><span class="required">*</span> <?php echo $entry_password; ?></td>
            <td><input type="text" name="adyen_password" value="<?php echo $adyen_password; ?>" />
              <?php if ($error_password) { ?>
              <span class="error"><?php echo $error_password; ?></span>
              <?php } ?>
			</td>
          </tr>
          <tr>
            <td><?php echo $entry_teste; ?></td>
            <td><select name="adyen_teste">
                <?php if ($adyen_teste) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else if (!$adyen_teste) { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
                </select>
			</td>
          </tr>
          <tr>
            <td><?php echo $entry_cartao_visa; ?></td>
            <td><select name="adyen_cartao_visa">
                <?php if ($adyen_cartao_visa) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else if (!$adyen_cartao_visa) { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
                </select>
                &nbsp;<?php echo $entry_parcelas;?><input style="width:20px" type="text" name="adyen_visa_parcelas" value="<?php echo $adyen_visa_parcelas; ?>" />
			</td>
          </tr>
          <tr>
            <td><?php echo $entry_cartao_amex; ?></td>
            <td><select name="adyen_cartao_amex">
                <?php if ($adyen_cartao_amex) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else if (!$adyen_cartao_amex) { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
                </select>
                &nbsp;<?php echo $entry_parcelas;?><input style="width:20px" type="text" name="adyen_amex_parcelas" value="<?php echo $adyen_amex_parcelas; ?>" />
			</td>
          </tr>
          <tr>
            <td><?php echo $entry_cartao_mastercard; ?></td>
            <td><select name="adyen_cartao_mastercard">
                <?php if ($adyen_cartao_mastercard) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else if (!$adyen_cartao_mastercard) { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
                </select>
                &nbsp;<?php echo $entry_parcelas;?><input style="width:20px" type="text" name="adyen_mastercard_parcelas" value="<?php echo $adyen_mastercard_parcelas; ?>" />
			</td>
          </tr>
          <tr>
            <td><?php echo $entry_cartao_diners; ?></td>
            <td><select name="adyen_cartao_diners">
                <?php if ($adyen_cartao_diners) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else if (!$adyen_cartao_diners) { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
                </select>
                &nbsp;<?php echo $entry_parcelas;?><input style="width:20px" type="text" name="adyen_diners_parcelas" value="<?php echo $adyen_diners_parcelas; ?>" />
			</td>
          </tr>
          <tr>
            <td><?php echo $entry_cartao_discover; ?></td>
            <td><select name="adyen_cartao_discover">
                <?php if ($adyen_cartao_discover) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else if (!$adyen_cartao_discover) { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
                </select>
                &nbsp;<?php echo $entry_parcelas;?><input style="width:20px" type="text" name="adyen_discover_parcelas" value="<?php echo $adyen_discover_parcelas; ?>" />
			</td>
          </tr>
          <tr>
            <td><?php echo $entry_cartao_elo; ?></td>
            <td><select name="adyen_cartao_elo">
                <?php if ($adyen_cartao_elo) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else if (!$adyen_cartao_elo) { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
                </select>
                &nbsp;<?php echo $entry_parcelas;?><input style="width:20px" type="text" name="adyen_elo_parcelas" value="<?php echo $adyen_elo_parcelas; ?>" />
			</td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_cartao_semjuros;?></td>
            <td><input style="width:20px" type="text" name="adyen_cartao_semjuros" value="<?php echo $adyen_cartao_semjuros; ?>" />
              <?php if ($error_cartao_semjuros) { ?>
              <span class="error"><?php echo $error_cartao_semjuros; ?></span>
              <?php } ?>
			</td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_cartao_minimo;?></td>
            <td><input style="width:100px" type="text" name="adyen_cartao_minimo" value="<?php echo $adyen_cartao_minimo; ?>" />
              <?php if ($error_cartao_minimo) { ?>
              <span class="error"><?php echo $error_cartao_minimo; ?></span>
              <?php } ?>
			</td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_cartao_juros;?></td>
            <td><input style="width:20px" type="text" name="adyen_cartao_juros" value="<?php echo $adyen_cartao_juros; ?>" />
              <?php if ($error_cartao_juros) { ?>
              <span class="error"><?php echo $error_cartao_juros; ?></span>
              <?php } ?>
			</td>
          </tr>
          <tr>
            <td><?php echo $entry_parcelamento; ?></td>
            <td><select name="adyen_parcelamento">
                <?php if ($adyen_parcelamento == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_loja; ?></option>
                <option value="2"><?php echo $text_administradora; ?></option>
                <?php } else if ($adyen_parcelamento == '2') { ?>
                <option value="1"><?php echo $text_loja; ?></option>
                <option value="2" selected="selected"><?php echo $text_administradora; ?></option>
                <?php } else { ?>
                <option value="1" selected="selected"><?php echo $text_loja; ?></option>
                <option value="2"><?php echo $text_administradora; ?></option>
                <?php } ?>
                </select>
			</td>
          </tr>
          <tr>
            <td><?php echo $entry_aprovado; ?></td>
            <td><select name="adyen_aprovado_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $adyen_aprovado_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
			</td>
          </tr>
          <tr>
            <td><?php echo $entry_nao_aprovado; ?></td>
            <td><select name="adyen_nao_aprovado_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $adyen_nao_aprovado_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
			</td>
          </tr>
          <tr>
            <td><?php echo $entry_geo_zone; ?></td>
            <td><select name="adyen_geo_zone_id">
                <option value="0"><?php echo $text_all_zones; ?></option>
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $adyen_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
			</td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="adyen_status">
                <?php if ($adyen_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
			</td>
          </tr>
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="adyen_sort_order" value="<?php echo $adyen_sort_order; ?>" size="1" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?> 