<?php
// Heading
$_['heading_title']					= 'Correios - Rastrear Encomendas';
$_['text_module']					= 'Módulos';

// Text
$_['txt_user_notify']				= 'Notificar usuário quando código de rastreio for cadastrado';
$_['txt_order_status_post']			= 'Quando código de rastreio for cadastrado, mudar status do pedido para<span class="help">recomendamos que mude para algum que indique a postagem<span>';
$_['txt_order_status_final']		= 'Status quando a mercadoria for entregue<span class="help">Para qual status o pedido deve avançar quando a mercadoria for entregue no cliente. Recomendamos que seja diferente dos status definidos acima<span>';
$_['txt_set_status_notify']			= 'Selecione em quais status o rastreamento deve ser acompanhado<span class="help">Exemplo: despachado, pendente, processando</span>';
$_['text_success']					= 'Configurações salvas com sucesso';
$_['txt_url_cron']					= 'Habilite o Cron de seu servidor nesta URL';
$_['txt_status']					= 'Status';
$_['txt_action']					= 'Ação';
$_['txt_no_action']					= 'Nenhuma Ação';
$_['txt_notify_cad_cod']			= '%s seu pedido %s foi postado com sucesso, utilize este código: <b>%s</b> para rastrea-lo nos correios ou acesse essa url %s para rastrea-lo.';
$_['txt_email_subject']				= "%s - rastreamento de objetos nos correios";
$_['txt_tracking_code']				= "Pedido postado com sucesso, use o seguinte código <b>%s</b> para rastrea-lo ou acesse o seguinte link %s";
$_['txt_insert_tracking_code']		= "Códigos(s) de rastreamento inserido(s) com sucesso";
$_['txt_user_notify_success']		= "Código(s) de rastreamento inserido(s) com sucesso. <br />%d usuário(s) notificado(s) com sucesso";
$_['checking_update_text']			= 'Verificando se existem novas atualizações';
$_['txt_msg_email']					= 'Mensagem de Email<span class="help">Use o editor para compor a mensagem de email que será enviada para informar ao usuário.<br /><b>Inclua na mensagem os seguintes códigos:</b><br /><br /><b><a href="javascript:;" onclick="ckInsert(\'%name_user%\')">%name_user%</a></b> = será substituido pelo nome do usuário<br /><b><a href="javascript:;" onclick="ckInsert(\'%number_order%\')">%number_order%</a></b> = será substituido pelo número do pedido<br /><b><a href="javascript:;" onclick="ckInsert(\'<a href=\\\'%url_order%\\\'>DESCRIÇÃO LINK</a>\')">%url_order%</a></b> = será substituido por link para visualizar o pedido<br /><b><a href="javascript:;" onclick="ckInsert(\'%number_tracker%\')">%number_tracker%</a></b> = será substituido pelo número do código de rastreio<br /><b><a href="javascript:;" onclick="ckInsert(\'<a href=\\\'%url_tracker%\\\'>DESCRIÇÃO LINK</a>\')">%url_tracker%</a></b> = será substituido por link para visualizar o rastreamento<br /><b><a href="javascript:;" onclick="ckInsert(\'%table_tracker%\')">%table_tracker%</a></b> = será substituido pela tabela de rastreamento dos correios<br /><b><a href="javascript:;" onclick="ckInsert(\'%tracker_status%\')">%tracker_status%</a></b> = será substituido pelo status atual do objeto nos correios<br /><b><a href="javascript:;" onclick="ckInsert(\'%date_tracker_status%\')">%date_tracker_status%</a></b> = será substituido pela data atual do status nos correios.</span>';

// Error
$_['error_permission']				= 'Atenção: Você não possui permissão para modificar este módulo';
$_['error_message_not_defined']		= '<span class="error">É necessário configurar a mensagem de email no módulo, <a href="%s">clique aqui</a> para configurar agora.</span>';

?>