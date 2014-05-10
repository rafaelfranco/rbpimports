<script type="text/javascript">
<!--
window.name='loja';
function vai()
{
window.location = 'index.php?route=payment/boletoitau/confirm';
return true;
}
//-->
</script>
<?php
//Variaveis da compra.
$msg = '<center><br><h2>Obrigado pelo Pedido</h2>';
$valorBoleto = $valorpedido;
if((!empty($desconto)) AND ($desconto>0)){
$valorBoleto = $valorBoleto-(($valorBoleto/100)*$desconto);
$msg .= '<i>Valor total de '.number_format($valorBoleto, 2, ',', '').' com desconto de '.$desconto.'%</i><br>';
}
$msg .= '<a href="'.HTTPS_SERVER.'boletos/boletoitau/boleto_itau.php?boleto='.$pedido.'" onclick="javascript:vai();" target="_blank">
<img src="'.HTTPS_SERVER.'/image/gerar_boleto.gif" border="0"></a>';
$msg .= '<br><br>Clique em "Gerar Boleto".</center>';
echo $msg;
?>
