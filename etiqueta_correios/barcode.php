<?php 
function fbarcode($valor){
$fino = 2 ;
$largo = 5 ;
$altura = 70 ;
$barcodes[0] = "00110";
$barcodes[1] = "10001";
$barcodes[2] = "01001";
$barcodes[3] = "11000";
$barcodes[4] = "00101";
$barcodes[5] = "10100";
$barcodes[6] = "01100";
$barcodes[7] = "00011";
$barcodes[8] = "10010";
$barcodes[9] = "01010";
for($f1=9;$f1>=0;$f1--){
for($f2=9;$f2>=0;$f2--){
$f = ($f1 * 10) +$f2 ;
$texto = "";
for($i=1;$i<6;$i++){
$texto .=  substr($barcodes[$f1],($i-1),1) .substr($barcodes[$f2],($i-1),1);
}
$barcodes[$f] = $texto;
}
}
;echo '<div>
  <img src=../etiqueta_correios/imagens/p.png width=';echo $fino;echo ' height=';echo $altura;echo ' border=0><img
src=../etiqueta_correios/imagens/b.png width=';echo $fino;echo ' height=';echo $altura;echo ' border=0><img
src=../etiqueta_correios/imagens/p.png width=';echo $fino;echo ' height=';echo $altura;echo ' border=0><img
src=../etiqueta_correios/imagens/b.png width=';echo $fino;echo ' height=';echo $altura;echo ' border=0><img
';
$texto = $valor ;
if((strlen($texto) %2) <>0){
$texto = "0".$texto;
}
while (strlen($texto) >0) {
$i = round(esquerda($texto,2));
$texto = direita($texto,strlen($texto)-2);
$f = $barcodes[$i];
for($i=1;$i<11;$i+=2){
if (substr($f,($i-1),1) == "0") {
$f1 = $fino ;
}else{
$f1 = $largo ;
}
;echo '		src=../etiqueta_correios/imagens/p.png width=';echo $f1;echo ' height=';echo $altura;echo ' border=0><img
	';
if (substr($f,$i,1) == "0") {
$f2 = $fino ;
}else{
$f2 = $largo ;
}
;echo '		src=../etiqueta_correios/imagens/b.png width=';echo $f2;echo ' height=';echo $altura;echo ' border=0><img
	';
}
}
;echo '	src=../etiqueta_correios/imagens/p.png width=';echo $largo;echo ' height=';echo $altura;echo ' border=0><img
	src=../etiqueta_correios/imagens/b.png width=';echo $fino;echo ' height=';echo $altura;echo ' border=0><img
	src=../etiqueta_correios/imagens/p.png width=';echo 1;echo ' height=';echo $altura;echo ' border=0>
	  ';
}
function esquerda($entra,$comp){
return substr($entra,0,$comp);
}
function direita($entra,$comp){
return substr($entra,strlen($entra)-$comp,$comp);
}
; ?>