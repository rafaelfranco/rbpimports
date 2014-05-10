<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1>Boleto Bancario - Itau</h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span>Salvar</span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span>Cancelar</span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
	  
	  <tr><td colspan='2'><h2>Dados de Configuracoes</h2></td></tr>
	  
	        <tr>
        <td width="18%"><span class="required">*</span> Nome do Modulo:</td>
        <td width="82%">
		<input type="text" name="boletoitau_nome" value="<?php echo $boletoitau_nome; ?>" size='80' />
          <br />

      </tr>
	  
	   <tr>
        <td>Status Padrao dos Pedidos</td>
        <td><select name="boletoitau_padrao">
          <?php foreach ($order_statuses as $order_status) { ?>
          <?php if ($order_status['order_status_id'] == $boletoitau_padrao) { ?>
          <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
		  <?php echo $order_status['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $order_status['order_status_id']; ?>">
		  <?php echo $order_status['name']; ?></option>
          <?php } ?>
          <?php } ?>
        </select></td>
      </tr>
	  
	  	  <tr>
        <td>Zona:</td>
        <td><select name="boletoitau_geo_zone_id">
            <option value="0">Todas as Zonas</option>
            <?php foreach ($geo_zones as $geo_zone) { ?>

            <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>

            <?php } ?>
          </select></td>
      </tr>
	  	  

      <tr>
        <td>Ordem:</td>
        <td><input type="text" name="boletoitau_sort_order" value="<?php echo $boletoitau_sort_order; ?>" size="1" /></td>
      </tr>
	  
	  <tr>
        <td width="18%"><span class="required">*</span> Desconto em % (0.00):</td>
        <td width="82%">
		<input type="text" name="boletoitau_desconto" value="<?php echo $boletoitau_desconto; ?>" size='2' />
          <br />

      </tr>
	  
	  <tr>
        <td>Status:</td>
        <td><select name="boletoitau_status">
            <?php if ($boletoitau_status) { ?>
            <option value="1" selected="selected">Ativo</option>
            <option value="0">Inativo</option>
            <?php } else { ?>
            <option value="1">Ativo</option>
            <option value="0" selected="selected">Inativo</option>
            <?php } ?>
          </select></td></tr>
	  
	  <tr><td colspan='2'><h2>Dados do Boleto</h2></td></tr>
	  
      <tr>
        <td width="18%"><span class="required">*</span> Cedente:</td>
        <td width="82%">
		<input type="text" name="boletoitau_cedente" value="<?php echo $boletoitau_cedente; ?>" size='80' />
          <br />

      </tr>
	  
	  <tr>
        <td width="18%"><span class="required">*</span> Taxa do Boleto (0.00):</td>
        <td width="82%">
		<input type="text" name="boletoitau_agenciadv" value="<?php echo $boletoitau_agenciadv; ?>" />
          <br />

      </tr>
	  
	        <tr>
        <td width="18%"><span class="required">*</span> Agencia (Sem Digito):</td>
        <td width="82%">
		<input type="text" name="boletoitau_agencia" value="<?php echo $boletoitau_agencia; ?>" />
          <br />

      </tr>
	  
	  	        
	  
	        <tr>
        <td width="18%"><span class="required">*</span> Conta (Sem Digito):</td>
        <td width="82%"><input type="text" name="boletoitau_conta" value="<?php echo $boletoitau_conta; ?>" />
          <br />

		  
      </tr>
	  
	    <tr>
        <td width="18%"><span class="required">*</span> DV Conta (Apenas Digito):</td>
        <td width="82%"><input type="text" name="boletoitau_contadv" value="<?php echo $boletoitau_contadv; ?>" />
          <br />

		  
      </tr>
	  
	        <tr>
        <td width="18%"><span class="required">*</span> Carteira (175, 174, 104, 109, 178 ou 157):</td>
        <td width="82%"><input type="text" name="boletoitau_carteira" value="<?php echo $boletoitau_carteira; ?>" />
          <br />

      </tr>
	  
	  
	        </tr>
	  

  
	  
	<tr>
        <td width="18%"><span class="required">*</span> Demostrativo 01:</td>
        <td width="82%"><input type="text" name="boletoitau_demo1" value="<?php echo $boletoitau_demo1; ?>" size='80' />
          <br />

      </tr>
	  
	  <tr>
        <td width="18%"><span class="required">*</span> Demostrativo 02:</td>
        <td width="82%"><input type="text" name="boletoitau_demo2" value="<?php echo $boletoitau_demo2; ?>" size='80' />
          <br />

      </tr>
	  
	  <tr>
        <td width="18%"><span class="required">*</span> Demostrativo 03:</td>
        <td width="82%"><input type="text" name="boletoitau_demo3" value="<?php echo $boletoitau_demo3; ?>" size='80' />
          <br />

      </tr>
	  
	
	<tr>
        <td width="18%"><span class="required">*</span> Instrucao 01:</td>
        <td width="82%"><input type="text" name="boletoitau_instrucao1" value="<?php echo $boletoitau_instrucao1; ?>" size='80' />
          <br />

      </tr>
	  
	<tr>
        <td width="18%"><span class="required">*</span> Instrucao 02:</td>
        <td width="82%"><input type="text" name="boletoitau_instrucao2" value="<?php echo $boletoitau_instrucao2; ?>" size='80' />
          <br />

      </tr>
	  
	  
	  <tr>
        <td width="18%"><span class="required">*</span> Instrucao 03:</td>
        <td width="82%"><input type="text" name="boletoitau_instrucao3" value="<?php echo $boletoitau_instrucao3; ?>" size='80' />
          <br />

      </tr>
	  
	  
	  <tr>
        <td width="18%"><span class="required">*</span> Instrucao 04:</td>
        <td width="82%"><input type="text" name="boletoitau_instrucao4" value="<?php echo $boletoitau_instrucao4; ?>" size='80' />
          <br />

      </tr>
	  
	  
 
	  
	  <tr>
        <td width="18%"><span class="required">*</span> CPF/CNPJ do Boleto (So Numero):</td>
        <td width="82%"><input type="text" name="boletoitau_cpf" value="<?php echo $boletoitau_cpf; ?>" />
          <br />

      </tr>
	  
	  <tr>
        <td width="18%"><span class="required">*</span> Vencimento em Dias (Inteiro):</td>
        <td width="82%"><input type="text" name="boletoitau_vencimento" value="<?php echo $boletoitau_vencimento; ?>" />
          <br />

      </tr>
	  
	  
	  
	  


	  
	  

	  
    </table>
    </form>
  </div>
</div>
<br><center><b>Boleto Itau 1.5 - By Loja5</b>
</body>
</html>