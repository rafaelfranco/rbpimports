jQuery(document).ready(function($) {
	$('input[name=postcode]').change(function() {
        preencheEndereco($(this).val());
	});


    $('.button-email').click(function() {
        if($('#email').val() === '') {
            alert('Insira seu e-mail');
        } else {
            $.ajax({
                url: '/cadastraEmail.php',
                type: 'POST',
                data: "email="+$('#email').val()+"&produto="+$('input[name=product_id]').val(),
            success: function(json) {
                
                $('#email').attr('value','');
                alert('E-mail cadastrado com sucesso');
                }
            });
        }
    });

    $('#simulaFrete').click(function() {
        if($('#cep').val() === '') {
            alert('Preencha o CEP');
        } else {
            opcoes = '';
            $("input[type=checkbox]").each(function( index ) {
                if($(this).attr('checked') == 'checked') {
                   opcoes = opcoes + $(this).val()+',';
                }
            });
            $.ajax({
                url: '/index.php?route=checkout/shipping_simulate',
                type: 'POST',
                data: "cep="+$('#cep').val()+"&produto="+$('input[name=product_id]').val()+'&opcoes='+opcoes,
            success: function(json) {
                    $('#freteSimulado').html(json);
                }
            });
        }
    });



});

function onlyNumbers(evt)
{
    var e = event || evt; // for trans-browser compatibility
    var charCode = e.which || e.keyCode;
    
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;

}

function preencheEndereco(cependereco) {
    if(cependereco.length < 8) {
        $('#ceperro').remove();
       $('input[name=postcode]').after('<div id="ceperro" class="text-danger">CEP Inválido</div>');
    } else {
        $.ajax({
            url: '/index.php?route=module/cep',
            type: 'POST',
            data: "CEP="+cependereco,
            success: function(json) {
                dados = json.split(";");
                if(dados[0].trim() == '') {
                    $('input[name=postcode]').after('<span class="error">CEP Inválido</span>');
                } 
                $('input[name=address_1]').val(dados[0]);
                $('input[name=address_2]').val(dados[1]);
                $('input[name=city]').val(dados[2]);

                //define state
                switch(dados[3]) {
                    case 'AC' :
                        $('select[name=zone_id]').val(440);
                    break;
                    case 'AL' :
                        $('select[name=zone_id]').val(441);
                    break;
                    case 'AP' :
                        $('select[name=zone_id]').val(442);
                    break;
                    case 'AM' :
                        $('select[name=zone_id]').val(443);
                    break;
                    case 'BA' :
                        $('select[name=zone_id]').val(444);
                    break;
                    case 'CE' :
                        $('select[name=zone_id]').val(445);
                    break;
                    case 'DF' :
                        $('select[name=zone_id]').val(446);
                    break;
                    case 'ES' :
                        $('select[name=zone_id]').val(447);
                    break;
                    case 'GO' :
                        $('select[name=zone_id]').val(448);
                    break;
                    case 'MA' :
                        $('select[name=zone_id]').val(449);
                    break;
                    case 'MT' :
                        $('select[name=zone_id]').val(450);
                    break;
                    case 'MS' :
                        $('select[name=zone_id]').val(451);
                    break;
                    case 'MG' :
                        $('select[name=zone_id]').val(452);
                    break;
                    case 'PA' :
                        $('select[name=zone_id]').val(453);
                    break;
                    case 'PB' :
                        $('select[name=zone_id]').val(454);
                    break;
                    case 'PR' :
                        $('select[name=zone_id]').val(455);
                    break;
                    case 'PE' :
                        $('select[name=zone_id]').val(456);
                    break;
                    case 'PI' :
                        $('select[name=zone_id]').val(457);
                    break;
                    case 'RJ' :
                        $('select[name=zone_id]').val(458);
                    break;
                    case 'RN' :
                        $('select[name=zone_id]').val(459);
                    break;
                    case 'RS' :
                        $('select[name=zone_id]').val(460);
                    break;
                    case 'RO' :
                        $('select[name=zone_id]').val(461);
                    break;
                    case 'RR' :
                        $('select[name=zone_id]').val(462);
                    break;
                    case 'SC' :
                        $('select[name=zone_id]').val(463);
                    break;
                    case 'SP' :
                        $('select[name=zone_id]').val(464);
                    break;
                    case 'SE' :
                        $('select[name=zone_id]').val(465);
                    break;
                    case 'TO' :
                        $('select[name=zone_id]').val(466);
                    break;
                }
             }
        });
    }
}
function valida_cpf(cpfObj){
  cpf = cpfObj;

  cpf = cpf.replace('.','');
  cpf = cpf.replace('-','');
  cpf = cpf.replace('.','');
  
  var numeros, digitos, soma, i, resultado, digitos_iguais;
  digitos_iguais = 1;
  if (cpf.length < 11){
        $('#cpferro').remove();
        $('#cpf_erro').remove();
        $('input[name=tax_id]').after('<span class="error">Preencha o CPF completo</div><input type="hidden" name="cpf_erro" id="cpf_erro" value="1">');
        return 0;
  }
        
  for (i = 0; i < cpf.length - 1; i++) {
    if (cpf.charAt(i) != cpf.charAt(i + 1))
    {
        digitos_iguais = 0;
        break;
    }
  }

  if (!digitos_iguais)  {
        numeros = cpf.substring(0,9);
        digitos = cpf.substring(9);
        soma = 0;
        for (i = 10; i > 1; i--) {
            soma += numeros.charAt(10 - i) * i;
        }
        resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
        if (resultado != digitos.charAt(0)){
            $('#cpferro').remove();
            $('#cpf_erro').remove();
            $('input[name=tax_id]').after('<span class="error">CPF inválido</span><input type="hidden" name="cpf_erro" id="cpf_erro" value="1">');
            return 0;
        }
        numeros = cpf.substring(0,10);
        soma = 0;
        for (i = 11; i > 1; i--)
              soma += numeros.charAt(11 - i) * i;
        resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
        if (resultado != digitos.charAt(1)) {
            $('#cpferro').remove();
            $('#cpf_erro').remove();
            $('input[name=tax_id]').after('<span class="error">CPF inválido</span><input type="hidden" name="cpf_erro" id="cpf_erro" value="1">');
            return 0;
        }
    } else {
        $('#cpferro').remove();
        $('#cpf_erro').remove();
        $('input[name=tax_id]').after('<span class="error">CPF inválido</span><input type="hidden" name="cpf_erro" id="cpf_erro" value="1">');
        return 0;
    } 
    $('#cpferro').remove();
    $('#cpf_erro').remove();
} 
