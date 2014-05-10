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
                    <td width="25%">
                        <span class="required">*</span>
                        <?php echo $lb_convenio; ?>
                    </td>
                    <td>
                        <input type="text" name="meucheckout_convenio" value="<?php echo $meucheckout_convenio; ?>" />
                        <br />
                        <?php if ($error_convenio): ?>
                        <span class="error"><?php echo $error_convenio; ?></span>
                        <?php endif ?>
                    </td>
                </tr>
                <tr>
                    <td><?php echo $entry_order_status; ?></td>
                    <td><select name="meucheckout_order_status_id">
                        <?php foreach ($order_statuses as $order_status) { ?>
                        <?php if ($order_status['order_status_id'] == $meucheckout_order_status_id) { ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                        </select>
                    </td>
                </tr>                
                <tr>
                    <td width="25%">
                        <?php echo $lb_sort_order; ?>
                    </td>
                    <td>
                        <input type="text" name="meucheckout_sort_order" value="<?php echo $meucheckout_sort_order; ?>" size="3" />
                    </td>
                </tr>
                <tr>
                    <td><?php echo $lb_status; ?></td>
                    <td>
                        <select name="meucheckout_status">
                            <?php if ($meucheckout_status) { ?>
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
                    <td>Target de Abertura da Página do Meu Checkout</td>
                    <td>
                        <select name="meucheckout_target">
                            <?php if ($meucheckout_target == '_blank') { ?>
				<option value="_blank" selected="selected">Nova Aba / Janela</option>
				<option value="_parent">Mesma Janela</option>
				<option value="popup">Pop-Up (Está sujeita a bloqueio pelos navegadores)</option>
			    <?php } elseif($meucheckout_target == '_parent') { ?>
				<option value="_blank">Blank</option>
				<option value="_parent" selected="selected">Mesma Janela</option>
				<option value="popup">Pop-Up (Está sujeita a bloqueio pelos navegadores)</option>
			    <?php } elseif($meucheckout_target == 'popup') { ?>
				<option value="_blank">Blank</option>
				<option value="_parent">Mesma Janela</option>
				<option value="meucheckout" selected="selected">Pop-Up (Está sujeita a bloqueio pelos navegadores)</option>
			    <?php }else{ ?>
				<option value="_blank">Blank</option>
				<option value="_parent">Mesma Janela</option>
				<option value="popup">Pop-Up (Está sujeita a bloqueio pelos navegadores)</option>
			    <?php } ?>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </div><!-- content -->
</div>
</div>
<?php echo $footer; ?>
