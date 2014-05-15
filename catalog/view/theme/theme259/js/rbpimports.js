jQuery(document).ready(function($) {
	$('input[name=postcode]').change(function() {
		$.ajax({
            url: '/index.php?route=module/cep',
            type: 'POST',
            data: "CEP="+$(this).val(),
            success: function(json) {
            	console.log(json);
				dados = json.split(";");
                $('input[name=address_1]').val(dados[0]);
                $('input[name=address_2]').val(dados[1]);
                $('input[name=city]').val(dados[2]);

                //define state
                switch(dados[3]) {
                    case 'AC' :
                        $('#zone').val(440);
                    break;
                    case 'AL' :
                        $('#zone').val(441);
                    break;
                    case 'AP' :
                        $('#zone').val(442);
                    break;
                    case 'AM' :
                        $('#zone').val(443);
                    break;
                    case 'BA' :
                        $('#zone').val(444);
                    break;
                    case 'CE' :
                        $('#zone').val(445);
                    break;
                    case 'DF' :
                        $('#zone').val(446);
                    break;
                    case 'ES' :
                        $('#zone').val(447);
                    break;
                    case 'GO' :
                        $('#zone').val(448);
                    break;
                    case 'MA' :
                        $('#zone').val(449);
                    break;
                    case 'MT' :
                        $('#zone').val(450);
                    break;
                    case 'MS' :
                        $('#zone').val(451);
                    break;
                    case 'MG' :
                        $('#zone').val(452);
                    break;
                    case 'PA' :
                        $('#zone').val(453);
                    break;
                    case 'PB' :
                        $('#zone').val(454);
                    break;
                    case 'PR' :
                        $('#zone').val(455);
                    break;
                    case 'PE' :
                        $('#zone').val(456);
                    break;
                    case 'PI' :
                        $('#zone').val(457);
                    break;
                    case 'RJ' :
                        $('#zone').val(458);
                    break;
                    case 'RN' :
                        $('#zone').val(459);
                    break;
                    case 'RS' :
                        $('#zone').val(460);
                    break;
                    case 'RO' :
                        $('#zone').val(461);
                    break;
                    case 'RR' :
                        $('#zone').val(462);
                    break;
                    case 'SC' :
                        $('#zone').val(463);
                    break;
                    case 'SP' :
                        $('#zone').val(464);
                    break;
                    case 'SE' :
                        $('#zone').val(465);
                    break;
                    case 'TO' :
                        $('#zone').val(466);
                    break;
                }
             }
        });
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
            $.ajax({
                url: '/index.php?route=checkout/shipping_simulate',
                type: 'POST',
                data: "cep="+$('#cep').val()+"&produto="+$('input[name=product_id]').val(),
            success: function(json) {
                    $('#freteSimulado').html(json);
                }
            });
        }
    });

});