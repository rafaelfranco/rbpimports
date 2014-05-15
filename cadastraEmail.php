<?php 
	include 'config.php';

	mysql_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD);
	mysql_select_db(DB_DATABASE);

	$email = $_REQUEST['email'];
	$produto = $_REQUEST['produto'];

	$sql = "INSERT INTO `oc_notifyme` (`id`, `email`, `product`, `notified`) 
			VALUES(null, '$email', $produto, 0);";
	mysql_query($sql);

	//envia email de notificação
	$html = 'Prezado Cliente,<br><br>

Muito obrigado por visitar e comprar em nosso site. É um prazer tê-lo como cliente!<br><br>

Você se cadastrou no sistema “avise-me quando disponível”.<br><br>

Infelizmente no momento não temos em estoque o produto que deseja, mas assim que tiver disponível em estoque entraremos em contato pelo email cadastrado.<br><br>
 
Atenciosamente,<br>
RBP Eletrônicos<br>
www.rbpimports.com<br>
';

	#envio a notificação para o lojista
	$headers  = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/html; charset=UTF-8' . "\r\n";
    $headers .= 'From: Pedidos Fashionera <alerta@rbpimports.com.br>' . "\r\n";;
   
    mail($email, '[RBP Imports] Avise-me quando disponivel', $html ,$headers);

	
?>