<?php 
	/**
	* Script responsavel por alertar clientes sobre a disponibilidade de um produto que voltou ao estoque
	*
	**/

	include 'config.php';

	mysql_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD);
	mysql_select_db(DB_DATABASE);

	$email = $_REQUEST['email'];
	$produto = $_REQUEST['produto'];

	//busca notificacoes pendentes
	$sql = "select * from `oc_notifyme` where product in (select product_id from oc_product where quantity > 0 ) and notified = 0";
	$res = mysql_query($sql);


	//envia email de notificação
	$html = 'Prezado Cliente,<br><br>
			 Muito obrigado por visitar e comprar em nosso site. É um prazer tê-lo como cliente!<br><br>
			Você se cadastrou no sistema “avise-me quando disponível” e temos o prazer de lhe informar que o produto que deseja está novamente em estoque e está disponível para compra em nosso site.<br><br>

			Atenciosamente,<br>
			RBP Eletrônicos<br>
			www.rbpimports.com';

	#envio a notificação para o lojista
	$headers  = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/html; charset=UTF-8' . "\r\n";
    $headers .= 'From: Alerta RBP Imports <alerta@rbpimports.com.br>' . "\r\n";;
	while ($row = mysql_fetch_assoc($res)) {
		
		mail($row['email'], '[RBP Imports] Avise-me quando disponivel', $html ,$headers);

		mysql_query("UPDATE oc_notifyme SET notified = 1 WHERE id = ".$row['id']);
	}
	
	
   
  

	
?>