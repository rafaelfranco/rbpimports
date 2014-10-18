<?php
// Heading
$_['heading_title']					= 'Track Orders';
$_['text_module']					= 'Modules';

// Text
$_['txt_user_notify']				= 'Notify user when tracing code is registered';
$_['txt_order_status_post']			= 'Status when the goods are posted at the post office';
$_['txt_order_status_final']		= 'Status when the merchandise is delivered<span class="help">Status to which the request should proceed when the merchandise is delivered to the customer<span>';
$_['txt_set_status_notify']			= 'Select status in which the client must be notified';
$_['text_success']					= 'Settings saved successfully';
$_['txt_url_cron']					= 'Enable Cron your server this URL';
$_['txt_status']					= 'Status';
$_['txt_action']					= 'Action';
$_['txt_no_action']					= 'Not Action';
$_['txt_notify_cad_cod']			= '%s your order %s was successfully posted, use this code: <b>%s</b> traceability for it at the post office or visit this url %s para rastrea-lo.';
$_['txt_email_subject']				= "%s - object tracking in post";
$_['txt_tracking_code']				= "Product posted in the post office, use this code: <b>%s</b> traceability for it.";
$_['txt_insert_tracking_code']		= "Code(s) inserted trace(s) successfully";
$_['txt_user_notify_success']		= "Code(s) inserted trace(s) successfully. <br />%d User(s) notified(s) successfully";
$_['checking_update_text']			= 'Checking for new updates';
$_['txt_msg_email']					= 'E-mail Message<span class="help">Use the editor to compose the email message that will be sent to inform the user.<br /><b>Include in the message the following codes:</b><br /><br /><b><a href="javascript:;" onclick="ckInsert(\'%name_user%\')">%name_user%</a></b> = will be replaced by the user name<br /><b><a href="javascript:;" onclick="ckInsert(\'%number_order%\')">%number_order%</a></b> = will be replaced by order number<br /><b><a href="javascript:;" onclick="ckInsert(\'<a href=\\\'%url_order%\\\'>DESCRIPTION LINK</a>\')">%url_order%</a></b> = will be replaced by link to view the application<br /><b><a href="javascript:;" onclick="ckInsert(\'%number_tracker%\')">%number_tracker%</a></b> = will be replaced by the number of the trace code<br /><b><a href="javascript:;" onclick="ckInsert(\'<a href=\\\'%url_tracker%\\\'>DESCRIPTION LINK</a>\')">%url_tracker%</a></b> = will be replaced by link to view the trace<br /><b><a href="javascript:;" onclick="ckInsert(\'%table_tracker%\')">%table_tracker%</a></b> = will be replaced by the trace table postal<br /><b><a href="javascript:;" onclick="ckInsert(\'%tracker_status%\')">%tracker_status%</a></b> = will be replaced by the current status of the object in post<br /><b><a href="javascript:;" onclick="ckInsert(\'%date_tracker_status%\')">%date_tracker_status%</a></b> = will be replaced by the current date status of the mail.</span>';

// Error
$_['error_permission']				= 'Warning: You do not have permission to modify this module';
$_['error_message_not_defined']		= '<span class="error">You must configure the e-mail message in module, <a href="%s">click here</a> to configure now.</span>';

?>