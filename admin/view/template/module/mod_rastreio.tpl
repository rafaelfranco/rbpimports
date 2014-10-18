<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/module.png" alt="" /><?php echo $heading_title; ?></h1>
			<div class="buttons"><a onclick="$('#form').submit();" class="button btn btn-primary"><?php echo $button_save; ?></a> <a onclick="location = '<?php echo $cancel; ?>';" class="button btn btn-primary"><?php echo $button_cancel; ?></a></div>
		</div>
		<div class="content">
			<br />
			<div id="checkupdate" class="attention"></div>
		
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
				<table class="form">
					<tr>
						<td><?php echo $txt_url_cron; ?></td>
						<td>
							<?php echo $url_cron; ?>
						</td>
					</tr>
					<tr>
						<td><?php echo $txt_user_notify; ?></td>
						<td>
							<input type="checkbox" name="user_notify" value="1" <?php echo ($user_notify ? 'checked' : ''); ?>/>
						</td>
					</tr>
					<tr>
						<td><?php echo $txt_order_status_post; ?></td>
						<td>
							<select name="mod_rastreio_order_status_posted">
								<option value=""><?php echo $txt_no_action; ?></option>
								<?php foreach ($order_statuses as $order_status) { ?>
									<?php if($order_status['order_status_id'] == $mod_rastreio_order_status_posted) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status["name"]; ?></option>
									<?php }else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status["name"]; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</td>
					</tr>
					<tr>
						<td><?php echo $txt_set_status_notify; ?></td>
						<td>
							<table id="statusOrder" class="list">
								<tbody>
									<tr>
										<td class="left"></td>
										<td class="left"><a onclick="addOrder_statuses();" class="button"><span><?php echo $button_add_discount; ?></span></a></td>
									</tr>
									<thead>
										<tr>
											<td><?php echo $txt_status; ?></td>
											<td><?php echo $txt_action; ?></td>
										</tr>
									</thead>
									<?php $mod_rastreio_statuscount = 0; ?>
									<?php foreach ($mod_rastreio_order_statuses as $mod_rastreio_order_status) { ?>
									<tbody id="row<?php echo $mod_rastreio_statuscount; ?>">
										<tr>
											<td class="left">
											<select name="mod_rastreio_order_statuses[<?php echo $mod_rastreio_statuscount; ?>]">
												<?php foreach ($order_statuses as $order_status) { ?>
													<?php if($order_status['order_status_id'] == $mod_rastreio_order_status) { ?>
														<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status["name"]; ?></option>
													<?php }else { ?>
														<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status["name"]; ?></option>
													<?php } ?>
												<?php } ?>
											</select>
											</td>
											<td class="left"><a onclick="$('#row<?php echo $mod_rastreio_statuscount; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
										</tr>
									</tbody>
									<?php $mod_rastreio_statuscount++; ?>
									<?php } ?>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td><?php echo $txt_order_status_final; ?></td>
						<td>
							<select name="mod_rastreio_order_status_final">
								<?php foreach ($order_statuses as $order_status) { ?>
									<?php if($order_status['order_status_id'] == $mod_rastreio_order_status_final) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status["name"]; ?></option>
									<?php }else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status["name"]; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</td>
					</tr>
					<tr>
						<td><?php echo $txt_msg_email; ?></td>
						<td>
						<?php if(defined('JPATH_MIJOSHOP_OC')) { ?>
						<?php echo MijoShop::get('base')->editor()->display("mod_rastreio_msg_email", $mod_rastreio_msg_email, '97% !important', '320', '50', '11'); ?>
						<?php }else{ ?>
							<textarea name="mod_rastreio_msg_email" cols="40" rows="5"><?php echo $mod_rastreio_msg_email; ?></textarea>
						<?php } ?>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<?php if(!defined('JPATH_MIJOSHOP_OC')) { ?>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
CKEDITOR.replace('mod_rastreio_msg_email', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

function ckInsert(html)
{
	CKEDITOR.instances.mod_rastreio_msg_email.insertHtml(html);
}
//--></script>
<?php } ?>

<script type="text/javascript"><!--
var mod_rastreio_statuscount = <?php echo $mod_rastreio_statuscount; ?>;

function addOrder_statuses() {	
	html  = '<tbody id="row' + mod_rastreio_statuscount + '">';
	html += '  <tr>';	
	html += '    <td class="left"><select name="mod_rastreio_order_statuses[' + mod_rastreio_statuscount + ']">';
	<?php foreach ($order_statuses as $order_status) { ?>
	html += '      <option value="<?php echo $order_status["order_status_id"]; ?>"><?php echo $order_status["name"]; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><a onclick="$(\'#row' + mod_rastreio_statuscount + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#statusOrder').append(html);
	
	mod_rastreio_statuscount++;
}

checking_update_text = "<?php echo $checking_update_text; ?>";
$(function()
{
	$.ajax(
	{
		url: '<?php echo $urlcheckupdate; ?>',
		dataType: 'json',
		beforeSend: function()
		{
			$("#checkupdate").text(checking_update_text);
		},
		success: function(data)
		{
			if(data.update)
			{
				$("#checkupdate").html(data.html);
			}
			else
			{
				$("#checkupdate").html(data.html);
				setTimeout(function()
				{
					$("#checkupdate").hide();
				}, 5000);
			}
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			setTimeout(function()
			{
				$("#checkupdate").hide();
			}, 5000);
		}
	});
});
//--></script>
<?php echo $footer; ?>