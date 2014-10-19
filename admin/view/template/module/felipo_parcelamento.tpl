<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img style="margin-top: -2px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAWCAYAAADNX8xBAAACOklEQVQ4y53UzW8VVRjH8c+Z3ts2gRZ65XUjuJCAQbQS09KlC8LOFQ5xZ4b/wIAb/wBka1xOXE8wxp0bXRjDRgMWV6I7F5CUEkutl2DvzGExmfti7qSNz+Yk53me73Oe5/zOoc2KvFmXFfmVib0plrQCOKjIb+E+vlXk3+NoGzCZAgiK/Dr+xidjse9hQ5F/Ic3+myMMN9KMIl/DVzhZewM//czuLm9dYGGBqoJtfCrNPm9yG9Ai7uDyEPDbQx4/ptOpS5Ylh5d44xyzXWKEdXwkzdaDIr+B22BmhkeP+P2PGjbNBgNOv8bpV8d3vwyK/AmO6Pf5Zb2unIzdQVkKg4E4NzcJjJHz51k6PBx2JQR++LF2jkHC9rZk44mw9Uyy+VQoqxEoBB48YHcAOkPHzMwo6PlzybPtOrgBl6WwuSl0u6re0ggmtugoBEm/3z6jFy+EetB7CHJMFdNdYZ/K/p/WAortGTHuExSj2J1tB3U64pT2OtMqxcUFceGgsLUl/Ls79FdHXhkpfcqJghhZeZdBOQKGIPZ6Ym9JPLSoOnF8EvJPn7Nn6XZr9bj6/jGsmZ/nzOv1E/hriySM9NUAQqj9J46ztsqBAw32m+bRHsN3eLNOSLh3j52dCUGan2f5bebmmpP/iQ+l2d1m2BvS7AJWsCNWXHyHS6uUVd3yxWVWV5idJcYBPpZmp3C3XXlFfhOfDduZvPI7uCbNqr2/2jS7jR6+HoP8inPS7ANU+5fq6PNfU+RX9wp/CcbixRns4vKHAAAAAElFTkSuQmCC" alt="Code Market - Primeiro Markteplace de TI" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <span class= 'help'><?php echo $text_info; ?> </span><br>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <table class="list">
                    <thead>
                        <tr>
                            <td><b> <?php echo $entry_ativo; ?> </b></td>
                            <td><b> <?php echo $entry_ativo_parcelamento; ?> </b></td>
                            <td><b> <?php echo $entry_opcao; ?> </b></td>
                            <td><b> <?php echo $entry_atualizar; ?> </b></td>
                            <td><b> <?php echo $entry_boleto_ativo; ?> </b></td>
                            <td><b> <?php echo $entry_aviso_frete; ?> </b></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <?php if (!empty($dados['ativo'])) { ?>
                                <input type="checkbox" name="modulo_felipo_parcelamento[ativo]" value="1" checked="checked"></td>
                            <?php } else { ?>
                    <input type="checkbox" name="modulo_felipo_parcelamento[ativo]" value="1"></td>
                    <?php } ?>

                    <td>
                        <?php if (!empty($dados['ativo_parcelamento'])) { ?>
                        <input type="checkbox" name="modulo_felipo_parcelamento[ativo_parcelamento]" value="1" checked="checked"></td>
                    <?php } else { ?>
                    <input type="checkbox" name="modulo_felipo_parcelamento[ativo_parcelamento]" value="1"></td>
                    <?php } ?>

                    <td>
                        <?php if (!empty($dados['opcao'])) { ?>
                        <input type="checkbox" name="modulo_felipo_parcelamento[opcao]" value="1" checked="checked"></td>
                    <?php } else { ?>
                    <input type="checkbox" name="modulo_felipo_parcelamento[opcao]" value="1"></td>
                    <?php } ?>

                    <td>
                        <?php if (!empty($dados['atualizar'])) { ?>
                        <input type="checkbox" name="modulo_felipo_parcelamento[atualizar]" value="1" checked="checked"></td>
                    <?php } else { ?>
                    <input type="checkbox" name="modulo_felipo_parcelamento[atualizar]" value="1"></td>
                    <?php } ?>

                    <td>
                        <?php if (!empty($dados['boleto_ativo'])) { ?>
                        <input type="checkbox" name="modulo_felipo_parcelamento[boleto_ativo]" value="1" checked="checked"></td>
                    <?php } else { ?>
                    <input type="checkbox" name="modulo_felipo_parcelamento[boleto_ativo]" value="1"></td>
                    <?php } ?>
                    <td>
                        <?php if (!empty($dados['aviso_frete'])) { ?>
                        <input type="checkbox" name="modulo_felipo_parcelamento[aviso_frete]" value="1" checked="checked"></td>
                    <?php } else { ?>
                    <input type="checkbox" name="modulo_felipo_parcelamento[aviso_frete]" value="1"></td>
                    <?php }  ?>
                    </tr>
                    </tbody>
                </table>
                <table class="list">
                    <thead>
                        <tr>
                            <td><b> <?php echo $entry_boleto_desconto; ?> </b></td>
                            <td><b> <?php echo $entry_maximo_parcela; ?> </b></td>
                            <td><b><?php echo $entry_parcela_minima; ?></b></td>
                            <td><b><?php echo $entry_parcela_sem_juros; ?></b></td>
                            <td><b><?php echo $entry_juros; ?></b></td>
                            <td><b><?php echo $entry_moeda_loja; ?></b></td>      
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input  size="12" type="text" name="modulo_felipo_parcelamento[boleto_desconto]" value="<?php if ($dados['boleto_desconto']) echo $dados['boleto_desconto']; ?>"></td>
                            <td><input type="text" name="modulo_felipo_parcelamento[maximo_parcela]" value="<?php if ($dados['maximo_parcela']) echo $dados['maximo_parcela']; ?>"></td>
                            <td><input type="text" name="modulo_felipo_parcelamento[parcela_minima]" value="<?php if ($dados['parcela_minima']) echo $dados['parcela_minima']; ?>"></td>
                            <td><input size="17" type="text" name="modulo_felipo_parcelamento[parcela_sem_juros]" value="<?php if ($dados['parcela_sem_juros']) echo $dados['parcela_sem_juros']; ?>"></td>
                            <td><input  size="8" type="text" name="modulo_felipo_parcelamento[juros]" value="<?php if ($dados['juros']) echo $dados['juros']; ?>"></td>
                            <td>
                                <select name="modulo_felipo_parcelamento[moeda_loja]">

                                    <?php foreach ($moedas as $m) {
                                    if($m['symbol_left'] == $dados['moeda_loja']) {
                                    echo "<option value= '".$m['symbol_left']."' selected>".$m['symbol_left']."</option>";
                                    }
                                    else {
                                    echo "<option value= '".$m['symbol_left']."'>".$m['symbol_left']."</option>";
                                    }
                                    } ?>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <?php echo $entry_texto_cartao; ?>
               <input size='60' type="text" name="modulo_felipo_parcelamento[texto_cartao]" value="<?php if ($dados['texto_cartao']) echo $dados['texto_cartao']; ?>">
                <br><?php echo $entry_cartao; ?>
                <input size='60' type="text" name="modulo_felipo_parcelamento[cartao]" value="<?php if ($dados['cartao']) echo $dados['cartao']; ?>" placeholder='ex: http://www.seu_site/image/payment/cartao.jpg' ><br>
                <br><?php echo $entry_texto_boleto; ?>
                <input size='60' type="text" name="modulo_felipo_parcelamento[texto_boleto]" value="<?php if ($dados['texto_boleto']) echo $dados['texto_boleto']; ?>">
                <br><?php echo $entry_boleto; ?>
                <input size='60' type="text" name="modulo_felipo_parcelamento[boleto]" value="<?php if ($dados['boleto']) echo $dados['boleto']; ?>" placeholder= 'ex: http://www.seu_site/image/payment/boleto.jpg'>     
                <br><br><?php echo $entry_texto_frete; ?>
                <input size='60' type="text" name="modulo_felipo_parcelamento[texto_frete]" value="<?php if ($dados['texto_frete']) echo $dados['texto_frete']; ?>">
                <br><br><?php echo $entry_css; ?>
                <textarea name="modulo_felipo_parcelamento[css]" rows="8" cols="62"><?php if ($dados['css']) { echo $dados['css']; } else { ?>
#texto_cartao{
    color:black;
    font-weight:bold;
    font-size:14px;
    margin-bottom:4px;
}

#texto_boleto{
    color:black;
    font-weight:bold;
    font-size:14px;
    margin-top:4px;
}

#frete{
    color:black;
    font-weight:bold;
    font-size:14px;
    margin-top:4px;
}

#gratis{
    color:green;
    font-weight:bold;
    font-size:14px;
}

.sem_juros{
    color:darkgreen;
    font-weight:normal;
    font-size:12px;
}

.com_juros{
    color:black;
    font-weight:normal;
    font-size:12px;
}

#aviso_juros{
    font-size: 10px; 
    font-weight:normal;
    margin-top:4px;
    margin-bottom:4px;
}

#tabela_parcelas {
    border: 1px solid #E9E9E9;;
    background-color: #FAFAFA;
    width: 70%;
    padding: 4px;
}
<? } ?></textarea>
            </form>
            <br>
            <button id="mostrar">Mostrar Dicas/Esconder</button>
            <span id="duvidas" class= 'help' style="display: none;"><?php echo $text_info2; ?> </span><br>
            <h4><?php echo $text_feito; ?></h4>
        </div>
    </div>
    <?php echo $footer; ?>
    <script>
        $(document).ready(function() {
            $("#mostrar").click(function() {
                $("#duvidas").toggle();
            });
        });
    </script>