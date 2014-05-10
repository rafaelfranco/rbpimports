<?php 
	include 'config.php';

	mysql_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD);
	mysql_select_db(DB_DATABASE);

	$email = $_GET['email'];
	$produto = $_GET['produto'];

	$sql = "INSERT INTO `oc_notifyme` (`id`, `email`, `product`, `notified`) 
			VALUES(null, '$email', $produto, 0);";
	mysql_query($sql);
	
?>