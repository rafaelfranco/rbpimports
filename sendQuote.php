<?php 
	
	//alter table oc_product ADD `owner` varchar(64) NOT NULL;

	require_once 'config.php';	
    require("class/class.phpmailer.php");

	extract($_REQUEST);

	$db = mysql_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD);
    mysql_select_db(DB_DATABASE);

    
		#envia o email
    	$msg="
    	Nova solicitação de cotação:<br/><br/>
    	Nome: $nome  <br/>
    	Email: $email <br/>
    	Código do produto: $codigo <br/>
    	Descrição: $descricao <br/>
    	Mensagem: $mailmessage <br/>
    	";

        #envio a notificação para o lojista
        $headers  = 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; charset=UTF-8' . "\r\n";
        $headers .= 'From: Cotação RBP Imports <cotação@rbpimports.com.br>' . "\r\n";

        mail('rafaelfranco@me.com', 'Nova solicitação de cotação', $msg,$headers);


        #envia email para o cliente
        $html = 'Prezado Cliente,<br/><br/>

Muito obrigado por visitar e comprar em nosso site. É um prazer tê-lo como cliente!<br/><br/>

Você se cadastrou no sistema “preço sob consulta”.<br/><br/>

Em breve entraremos em contato para fornecer o preço e prazo de entrega do produto de seu interesse.<br/><br/>
 
Atenciosamente,<br/>
RBP Eletrônicos<br/>
www.rbpimports.com';

    	echo 'SUCESSO';
	
	
?>