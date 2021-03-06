<?php if ($teste) { ?>
<div class="warning"><?php echo $text_teste; ?></div>
<?php } ?>
<?php
$order_info  = $this->model_checkout_order->getOrder($this->session->data['order_id']);
$valor_total = number_format($order_info['total'],2);
$valor_total = str_replace(".","",$valor_total);
?>
<div class="checkout-heading"><?php echo $text_barra; ?> </div>
<div class="content" id="payment">
    <form id="pag" action="" method="POST">
    <table class="form">
    <tr>
      <td>Escolha o cartão a ser usado</td>
      <td>
            <div style="width:330px;text-align:left;position:relative">
                <? if ($this->config->get('entry_cartao_visae') == 1) { ?>
                <div style="width:55px;height:80px;text-align:center;display:inline-table">
                    <img width="55" src="image/adyen/visae.jpg" /><br />
                    <input onchange="javascript:fn_pagamento(this.value,'<?=$this->config->get('adyen_visae_parcelas')?>');" type="radio" id="bandeira" name="bandeira" value="visae"  />
                </div>
                <? }?>
                <? if ($this->config->get('adyen_cartao_visa') == 1) { ?>
                <div style="width:55px;height:80px;text-align:center;display:inline-table">
                    <img width="55" src="image/adyen/visa.jpg" /><br />
                    <input onchange="javascript:fn_pagamento(this.value,'<?php echo $this->config->get('adyen_visa_parcelas');?>');" type="radio" id="bandeira" name="bandeira" value="visa"  />
                </div>
                <? }?>
                <? if ($this->config->get('adyen_cartao_mastercard') == 1) { ?>
                <div style="width:55px;height:80px;text-align:center;display:inline-table">
                    <img width="55" src="image/adyen/mastercard.jpg" /><br />
                    <input onchange="javascript:fn_pagamento(this.value,'<?php echo $this->config->get('adyen_mastercard_parcelas');?>');" type="radio" id="bandeira" name="bandeira" value="mastercard" />
                </div>
                <? }?>
                <? if ($this->config->get('adyen_cartao_diners') == 1) { ?>
                <div style="width:55px;height:80px;text-align:center;display:inline-table">
                    <img width="55" src="image/adyen/diners.jpg" /><br />
                    <input onchange="javascript:fn_pagamento(this.value,'<?php echo $this->config->get('adyen_diners_parcelas');?>');" type="radio" id="bandeira" name="bandeira" value="diners" />
                </div>
                <? }?>
                <? if ($this->config->get('adyen_cartao_amex') == 1) { ?>
                <div style="width:55px;height:80px;text-align:center;display:inline-table">
                    <img width="55" src="image/adyen/amex.jpg" /><br />
                    <input onchange="javascript:fn_pagamento(this.value,'<?php echo $this->config->get('adyen_amex_parcelas');?>');" type="radio" id="bandeira" name="bandeira" value="amex" />
                </div>
                <? }?>
                <? if ($this->config->get('adyen_cartao_discover') == 1) { ?>
                <div style="width:55px;height:80px;text-align:center;display:inline-table">
                    <img width="55" src="image/adyen/discover.jpg" /><br />
                    <input onchange="javascript:fn_pagamento(this.value,'<?php echo $this->config->get('adyen_discover_parcelas');?>');" type="radio" id="bandeira" name="bandeira" value="discover" />
                </div>
                <? }?>
                <? if ($this->config->get('adyen_cartao_elo') == 1) { ?>
                <div style="width:55px;height:80px;text-align:center;display:inline-table">
                    <img width="55" src="image/adyen/elo.jpg" /><br />
                    <input onchange="javascript:fn_pagamento(this.value,'<?php echo $this->config->get('adyen_elo_parcelas');?>');" type="radio" id="bandeira" name="bandeira" value="elo" />
                </div>
                <? }?>
                <span id="loader" style="display: none; position:absolute; top:8px; right:0;"><img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>
            </div>
      </td>
    </tr>
    <tr>
      <td><?php echo $entry_cc_owner; ?></td>
      <td>
          <div class="bg-input">
            <input type="text" name="cc_owner" value="" style="width: 260px" />
          </div>
      </td>
    </tr>
    <tr>
      <td><?php echo $entry_cc_number; ?></td>
      <td>
          <div class="bg-input">
            <input type="text" name="cc_number" value="" style="width: 260px" />
          </div>  
      </td>
    </tr>
    <tr class="card_date">
      <td><?php echo $entry_cc_expire_date; ?></td>
      <td><select name="cc_expire_date_month" class="selecto">
          <?php foreach ($months as $month) { ?>
          <option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
          <?php } ?>
        </select>
          <span>/</span>
        <select name="cc_expire_date_year" class="selecto">
          <?php foreach ($year_expire as $year) { ?>
          <option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
          <?php } ?>
        </select></td>
    </tr>
    <tr>
      <td><?php echo $entry_cc_cvv2; ?></td>
      <td>
          <div class="bg-input txt_cod">
            <input type="text" name="cc_cvv2" value="" size="3" />
          </div>
      </td>
    </tr>
    <tr>
        <td>Parcelas</td>
        <td id="parcelas">Selecione um cartão de crédito primeiro.<td>
    </tr>
  </table>
  </form>
</div>
<div class="buttons">
  <div class="right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="button" />
  </div>
</div>
<script type="text/javascript">
function fn_pagamento(bandeira,parcelas) {
    $.ajax({
        url: 'index.php?route=payment/adyen/parcelamento&bandeira='+bandeira+'&parcelas='+parcelas,
        type: 'GET',
        cache: false,
        dataType: 'html',
        beforeSend: function() {
            $('#loader').show();
        },
        complete: function() {
            $('#loader').hide();
        },
        success: function(data) {
            $('#parcelas').html(data);
        }
    });
}

$('#button-confirm').bind('click', function() {
    
    var status_valida=0;
        if( $("#pag input[name='bandeira']:checked").val()){
            status_valida=0;
        }else{
            status_valida=1;
        }
        if( $('#pag input[name="cc_owner"]').val() == "" ){
            status_valida=1;
        }
        
        if( $('#pag input[name="cc_number"]').val() == "" ){
            status_valida=1;
        }
        
        if( $('#pag input[name="cc_cvv2"]').val() == "" ){
            status_valida=1;
        }
        
        

        if(status_valida==1){

            $('.warning').html('Verifique os dados do fomulario...');

            return false;

        }else{
    
            $.ajax({
                url: 'index.php?route=payment/adyen/processar',
                type: 'post',
                data: $('#pag').serialize(),
                dataType: 'json',		
                beforeSend: function() {
                    $('#button-confirm').attr('disabled', 'disabled');
                    $('#payment').before('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
                },
                complete: function() {
                    $('#button-confirm').removeAttr('disabled');
                    $('.attention').remove();
                },				
                success: function(json) {
                    if (json['error']) {
                        alert(json['error']);
                    }

                    if (json['success']) {
                        location = json['success'];
                    }
                }
            });
        }
});

</script>