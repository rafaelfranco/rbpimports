<?php
global $itemId;

$itemId = (int) $_GET['boleto'];

if(empty($itemId)){
die('Boleto Invalido!');
}

include "dados.php";

//Variaveis do modulo
$BoletodiasVencimento = $config->get('boletoitau_vencimento');
$BoletoCedenteDocumento = $config->get('boletoitau_cpf');

$BoletoInstrucaoU = utf8_decode($config->get('boletoitau_instrucao1'));
$BoletoInstrucaoD = utf8_decode($config->get('boletoitau_instrucao2'));
$BoletoInstrucaoT = utf8_decode($config->get('boletoitau_instrucao3'));
$BoletoInstrucaoQ = utf8_decode($config->get('boletoitau_instrucao4'));
$BoletoDemoU = utf8_decode($config->get('boletoitau_demo1'));
$BoletoDemoD = utf8_decode($config->get('boletoitau_demo2'));
$BoletoDemoT = utf8_decode($config->get('boletoitau_demo3'));
$BoletoCedente = utf8_decode($config->get('boletoitau_cedente'));
$BoletoCarteira = $config->get('boletoitau_carteira');

$BoletoAgencia = $config->get('boletoitau_agencia');
$BoletoConta = $config->get('boletoitau_conta');
$BoletoDVC = $config->get('boletoitau_contadv');


$BoletoDVA = $config->get('boletoitau_agenciadv');

$desconto = $config->get('boletoitau_desconto');

$valorBoleto = $pedido->row['total'];
if((!empty($desconto)) AND ($desconto>0)){
$valorBoleto = $valorBoleto-(($valorBoleto/100)*$desconto);
}

$sacadoBoleto = utf8_decode($pedido->row['firstname'])." ".utf8_decode($pedido->row['lastname']);
$enderecoBoleto = utf8_decode($pedido->row['payment_address_1'])." - ".utf8_decode($pedido->row['payment_address_2'])." - ".utf8_decode($pedido->row['payment_zone'])." Cidade: ".utf8_decode($pedido->row['payment_city'])." CEP: ".$pedido->row['payment_postcode'];


$dias_de_prazo_para_pagamento = $BoletodiasVencimento;

$taxa_boleto = $BoletoDVA;
$data_venc = date("d/m/Y", time() + ($dias_de_prazo_para_pagamento * 86400));  // Prazo de X dias OU informe data: "13/04/2006"; 
$valor_cobrado = $valorBoleto; // Valor - REGRA: Sem pontos na milhar e tanto faz com "." ou "," ou com 1 ou 2 ou sem casa decimal
$valor_cobrado = str_replace(",", ".",$valor_cobrado);
$valor_boleto=number_format($valor_cobrado+$taxa_boleto, 2, ',', '');

$dadosboleto["nosso_numero"] = $itemId;  // Nosso numero - REGRA: Máximo de 8 caracteres!
$dadosboleto["numero_documento"] = $itemId;	// Num do pedido ou nosso numero
$dadosboleto["data_vencimento"] = $data_venc; // Data de Vencimento do Boleto - REGRA: Formato DD/MM/AAAA
$dadosboleto["data_documento"] = date("d/m/Y"); // Data de emissão do Boleto
$dadosboleto["data_processamento"] = date("d/m/Y"); // Data de processamento do boleto (opcional)
$dadosboleto["valor_boleto"] = $valor_boleto; 	// Valor do Boleto - REGRA: Com vírgula e sempre com duas casas depois da virgula

// DADOS DO SEU CLIENTE
$dadosboleto["sacado"] = $sacadoBoleto;
$dadosboleto["endereco1"] = $enderecoBoleto;
$dadosboleto["endereco2"] = "";

// INFORMACOES PARA O CLIENTE
$dadosboleto["demonstrativo1"] = $BoletoDemoU;
$dadosboleto["demonstrativo2"] = $BoletoDemoD;
$dadosboleto["demonstrativo3"] = $BoletoDemoT;
$dadosboleto["instrucoes1"] = $BoletoInstrucaoU;
$dadosboleto["instrucoes2"] = $BoletoInstrucaoD;
$dadosboleto["instrucoes3"] = $BoletoInstrucaoT;
$dadosboleto["instrucoes4"] = $BoletoInstrucaoQ;

// DADOS OPCIONAIS DE ACORDO COM O BANCO OU CLIENTE
$dadosboleto["quantidade"] = "";
$dadosboleto["valor_unitario"] = "";
$dadosboleto["aceite"] = "";		
$dadosboleto["especie"] = "R$";
$dadosboleto["especie_doc"] = "";


// ---------------------- DADOS FIXOS DE CONFIGURAÇÃO DO SEU BOLETO --------------- //


// DADOS DA SUA CONTA - ITAÚ
$dadosboleto["agencia"] = $BoletoAgencia; // Num da agencia, sem digito
$dadosboleto["conta"] = $BoletoConta;	// Num da conta, sem digito
$dadosboleto["conta_dv"] = $BoletoDVC; 	// Digito do Num da conta

// DADOS PERSONALIZADOS - ITAÚ
$dadosboleto["carteira"] = $BoletoCarteira;  // Código da Carteira: pode ser 175, 174, 104, 109, 178, ou 157

// SEUS DADOS
$dadosboleto["identificacao"] = "Boleto Online Itau - Opencart por Loja5 Sistemas de Pagamento";
$dadosboleto["cpf_cnpj"] = $BoletoCedenteDocumento;
$dadosboleto["endereco"] = "";
$dadosboleto["cidade_uf"] = "";
$dadosboleto["cedente"] = $BoletoCedente;

// NÃO ALTERAR!
include("include/funcoes_itau.php"); 
include("include/layout_itau.php");
?>
