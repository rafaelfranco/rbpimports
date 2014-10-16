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
      <h1><img style="margin-top: -2px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAWCAYAAADNX8xBAAACOklEQVQ4y53UzW8VVRjH8c+Z3ts2gRZ65XUjuJCAQbQS09KlC8LOFQ5xZ4b/wIAb/wBka1xOXE8wxp0bXRjDRgMWV6I7F5CUEkutl2DvzGExmfti7qSNz+Yk53me73Oe5/zOoc2KvFmXFfmVib0plrQCOKjIb+E+vlXk3+NoGzCZAgiK/Dr+xidjse9hQ5F/Ic3+myMMN9KMIl/DVzhZewM//czuLm9dYGGBqoJtfCrNPm9yG9Ai7uDyEPDbQx4/ptOpS5Ylh5d44xyzXWKEdXwkzdaDIr+B22BmhkeP+P2PGjbNBgNOv8bpV8d3vwyK/AmO6Pf5Zb2unIzdQVkKg4E4NzcJjJHz51k6PBx2JQR++LF2jkHC9rZk44mw9Uyy+VQoqxEoBB48YHcAOkPHzMwo6PlzybPtOrgBl6WwuSl0u6re0ggmtugoBEm/3z6jFy+EetB7CHJMFdNdYZ/K/p/WAortGTHuExSj2J1tB3U64pT2OtMqxcUFceGgsLUl/Ls79FdHXhkpfcqJghhZeZdBOQKGIPZ6Ym9JPLSoOnF8EvJPn7Nn6XZr9bj6/jGsmZ/nzOv1E/hriySM9NUAQqj9J46ztsqBAw32m+bRHsN3eLNOSLh3j52dCUGan2f5bebmmpP/iQ+l2d1m2BvS7AJWsCNWXHyHS6uUVd3yxWVWV5idJcYBPpZmp3C3XXlFfhOfDduZvPI7uCbNqr2/2jS7jR6+HoP8inPS7ANU+5fq6PNfU+RX9wp/CcbixRns4vKHAAAAAElFTkSuQmCC" alt="Code Market - Primeiro Markteplace de TI"> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
        <span class= 'help'><?php echo $text_info; ?> </span><br>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
         <table class="list">
     <thead>
     <tr>
        <td><b> <?php echo $entry_ativo; ?> </b></td>
        <td><b> <?php echo $entry_red; ?> </b></td>
        <td><b> <?php echo $entry_tirar; ?> </b></td>
        <td><b> <?php echo $entry_ordem; ?> </b></td>
        <td><b> <?php echo $entry_cor_comprar; ?> </b></td>
        <td><b> <?php echo $entry_cor_carrinho; ?> </b></td>
        <td><b> <?php echo $entry_comprar; ?> </b></td>
        <td><b> <?php echo $entry_carrinho; ?> </b></td>
        </tr>
      </thead>
        <tbody>
        <tr>
          <td>
            <?php if (!empty($dados['ativo'])) { ?>
              <input type="checkbox" name="felipo_comprar_agora[ativo]" value="1" checked="checked"></td>
            <?php } else { ?>
              <input type="checkbox" name="felipo_comprar_agora[ativo]" value="1"></td>
           <?php } ?>

             <td>
            <?php if (!empty($dados['red'])) { ?>
              <input type="checkbox" name="felipo_comprar_agora[red]" value="1" checked="checked"></td>
            <?php } else { ?>
              <input type="checkbox" name="felipo_comprar_agora[red]" value="1"></td>
           <?php } ?>
             <td>
            <?php if (!empty($dados['tirar'])) { ?>
              <input type="checkbox" name="felipo_comprar_agora[tirar]" value="1" checked="checked"></td>
            <?php } else { ?>
              <input type="checkbox" name="felipo_comprar_agora[tirar]" value="1"></td>
           <?php }  ?>
           <td>
            <?php if (!empty($dados['ordem'])) { ?>
              <input type="checkbox" name="felipo_comprar_agora[ordem]" value="1" checked="checked"></td>
            <?php } else { ?>
              <input type="checkbox" name="felipo_comprar_agora[ordem]" value="1"></td>
           <?php }  ?>
          <td><input type="text" name="felipo_comprar_agora[cor_comprar]" value="<?php if ($dados['cor_comprar']) { echo $dados['cor_comprar']; } else { echo 'rgb(0, 190, 107)';}?>"></td>
          <td><input type="text" name="felipo_comprar_agora[cor_carrinho]" value="<?php if ($dados['cor_carrinho']) echo $dados['cor_carrinho']; ?>"></td>
         <td><input type="text" name="felipo_comprar_agora[comprar]" value="<?php if ($dados['comprar']) { echo $dados['comprar']; } else { echo 'Comprar Agora'; } ?>"></td>
         <td><input type="text" name="felipo_comprar_agora[carrinho]" value="<?php if ($dados['carrinho']) { echo $dados['carrinho']; } else { echo 'Adicionar Carrinho';} ?>"></td>
        </tr>
          </tbody>
        </table>
      </form>
 <span class= 'help'><?php echo $text_exp; ?> </span><br>
          <h4><?php echo $text_feito; ?></h4>
    </div>
  </div>
</div>
<?php echo $footer; ?>
