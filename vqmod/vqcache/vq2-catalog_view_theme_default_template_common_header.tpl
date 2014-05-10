<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>

			<style>
				#blackBox {
					display:none;
					width:100%;
					height:100%;
					background-color:#000;
					position:absolute;
					z-index:1000;
					opacity:0.8;
				}
				#modalBox {
					display:none;
					background-color:#FFF;
					width:400px;
					padding-bottom:10px;
					margin:auto;
					text-align:left;
					padding-left:20px;
					line-height:22px;
					padding-top:10px;
					z-index:10000;
				}
				#containerModal {
					width:100%;
					text-align:center;
					z-index:2000;
					position:absolute;
					padding-top:130px;
				}
				#modalBox input {
					width:370px;
					height:30px;
				}
				#modalBox textarea {
					width:370px;
					height:60px;
				}
				#enviarCotacao {
					width:100px;
					height:30px;
					background-color:#666;
					display:block;
					border:solid;
					color:#FFF;
					margin-left:300px;
					cursor:pointer;
				}
				#close {
					background-color:#000;
					color:#FFF;
					text-align:center;
					width:20px;
					margin-left:380px;
					cursor:pointer;
					position:absolute;
				}
				
			</style>
			
			<div id="blackBox"></div>
			<div id="containerModal">
				<div id="modalBox">
					<div id="close" style="margin-top:-10px;">X</div>
					<b>Nome:</b> <br/><input type="text"  id="nome"/> <br/>
					<b>E-mail:</b> <br/><input type="text"  id="email"/> <br/>
					<b>Código do Produto:</b> <br/><input type="text"  id="codigo"/> <br/>
					<b>Descrição do Produto:</b> <br/><input type="text"  id="descricao"/> <br/>
					<b>Mensagem:</b> <br/>
					<textarea id="mailmessage" cols="30" rows="10"></textarea>
					<input style="width:80px;" type="button" id="enviarCotacao" value="Enviar"/>
				</div> 
			</div>

			<script>
				$(document).ready(function($) {
					$('#close').click(function() {
						$('#blackBox').hide();
						$('#containerModal').hide();
						$('#modalBox').hide();
					});
					<?php
						if($_GET['quote'] == 1) {
					?>
							$('#blackBox').show();
							$('#modalBox').show();
							$('#containerModal').show();
					<?php } ?>
 
					$('#descricao').attr('value',$('h1').html());
					$('#codigo').attr('value',$('input[name="product_id"]').val());
					
					$('#enviarCotacao').click(function() {
						//send quote
						$.ajax({
						url: '/sendQuote.php',
						type: 'POST',
						async: true,
						data: { 
							nome : $('#nome').val(),
							email : $('#email').val(),
							codigo : $('#codigo').val(),
							descricao : $('#descricao').val(),
							mailmessage : $('#mailmessage').val()
		     				},
				            success: function(json) {
				            	
				            }
				    	});	


						$('#modalBox').html('<div id="close" style="margin-top:-10px;">X</div> Solicitação enviada com sucesso!');
							$('#close').click(function() {
							$('#blackBox').hide();
							$('#containerModal').hide();
							$('#modalBox').hide();
						});
					});
				});
			</script>
			
<div id="container">
<div id="header">
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>
  <?php echo $language; ?>
  <?php echo $currency; ?>
  <?php echo $cart; ?>
  <div id="search">
    <div class="button-search"></div>
    <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
  </div>
  <div id="welcome">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
  </div>
  <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
</div>
<?php if ($categories) { ?>
<div id="menu">
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>
<?php } ?>
<?php if ($error) { ?>
    
    <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
    
<?php } ?>
<div id="notification"></div>
