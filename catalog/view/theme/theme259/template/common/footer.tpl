<div class="clear"></div>
</div>
</div>
</div>
<div class="clear"></div>
</section>
<footer>
	<div class="container">
		<div class="row">
			<?php if ($informations) { ?>
			<div class="span2">
				<h3><?php echo $text_information; ?></h3>
				<ul>
				<?php foreach ($informations as $information) { ?>
				<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				<?php } ?>
				</ul>
			</div>
			<?php } ?>
			<div class="span2">
				<h3><?php echo $text_service; ?></h3>
				<ul>
				<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
				<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				</ul>
			</div>
			<div class="span2">
				<h3><?php echo $text_extra; ?></h3>
				<ul>
				<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
				<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
				<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				</ul>
			</div>
			<div class="span2">
				<h3><?php echo $text_account; ?></h3>
				<ul>
				<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				</ul>
			</div>
			<div class="span2">
				<h3><?php echo $text_follow; ?></h3>
				<ul>
					<li><a href="http://facebook.com"><?php echo $text_fb; ?></a></li>
					<li><a href="http://twitter.com"><?php echo $text_twi; ?></a></li>
					<li><a href="#"><?php echo $text_rss; ?></a></li>
					<li><a href="http://youtube.com"><?php echo $text_yt; ?></a></li>
				</ul>
			</div>
			<div class="span2">
				<h3><?php echo $text_support; ?></h3>
				<div class="foot-phone">
					<div class="fleft">
						<i class="icon-phone"></i>
					</div>
					<div class="extra-wrap">
						<div>11 4824 8248</div>
						<div>Atendimento de seg a sex das 9 as 18</div>
						<div class="payments_types">

<a id="seloEbit" href="http://www.ebit.com.br/#RBP-Materiais-Eletricos-e-Eletronicos/selo" target="_blank" onclick="redir(this.href);" title="Avaliado pelos consumidores" oncontextmenu="alert(&quot;Cópia proibida – A certificação e-bit é de uso exclusivo de lojas conveniadas à e-bit.&quot;);return false;" style="display: block; overflow: hidden; position: relative;"><img src="https://a248.e.akamai.net/f/248/52872/0s/img.ebit.com.br/ebitBR/selo/img_49172.png" style="border: 0px;"></a> <script type="text/javascript" id="getSelo" src="https://558701205.r.anankecdn.com.br/ebitBR/static/getSelo.js?49172"></script>
</div>
					</div>
				</div>
				<ul>
					
				</ul>
			</div>
		</div>
		
<span id="siteseal"><img style="cursor:pointer;cursor:hand" src="https://seal.godaddy.com/images/3/en/siteseal_gd_3_h_l_m.gif" onclick="verifySeal();"></span>

<img src="catalog/view/theme/default/image/payment_paypal.png" alt="paypal" title="PayPal">
<img src="catalog/view/theme/default/image/payment_mastercard.png" alt="mastercard" title="MasterCard">
<img src="catalog/view/theme/default/image/payment_visa.png" alt="visa" title="Visa">
<img src="catalog/view/theme/default/image/payment_sedex.png" alt="Sedex" title="Sedex">
<img src="catalog/view/theme/default/image/payment_bcash.png" alt="BCash" title="BCash">

	</div>
	<div id="powered">
		<div class="container">
			<div class="row">
				<div class="span12">
					
					RBP Materiais Elétricos e Eletrónicos Rua Uirapuru 105 - Ribeirão Pires, SP CNPJ: 14.343.153/0001-46 <br><br>
					<b>Prezados Clientes, Não mantemos estoque neste endereço, nem mostruário. Nossas entregas são feitas via correio ou entregador</b>
				</div>
			</div>
		</div>
	</div>
</footer>
<script type="text/javascript" 	src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/livesearch.js"></script>
</div>
</div>
</div>

<!--Start of Zopim Live Chat Script-->
<script type="text/javascript">
window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute('charset','utf-8');
$.src='//v2.zopim.com/?27hUfCvv9HdSOH5Kv08k7mXiSmP8rl5S';z.t=+new Date;$.
type='text/javascript';e.parentNode.insertBefore($,e)})(document,'script');
</script>
<!--End of Zopim Live Chat Script-->
<?php echo $google_analytics; ?>
</body></html>