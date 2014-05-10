<?php
class ControllerPaymentMeucheckout extends Controller
{
    /**
     * index - Incluido à ultima tela do processo de compra
     * 
     * @access protected
     * @return void
     */
	protected function index() {
		$this->language->load('payment/meucheckout');
		$this->load->model('checkout/order');
		$this->load->model('payment/meucheckout');
		
		$this->data['button_confirm'] = $this->language->get('button_confirm');
		$this->data['button_back']    = $this->language->get('button_back');
		
		$this->session->data['token'] = isset($this->session->data['token']) ? $this->session->data['token'] : '';
		$this->data['continue']       = HTTPS_SERVER . 'index.php?route=checkout/success&token=' . $this->session->data['token'];
		$this->data['back']           = HTTPS_SERVER . 'index.php?route=checkout/payment&token=' . $this->session->data['token'];

		list($order, $cart) = $this->model_payment_meucheckout->getCart();
		$produtos = array();
		foreach ($cart as $item) {
			$produtos[] = array(
				'id'         => $item['product_id'],
				'descricao'  => $item['name'],
				'quantidade' => $item['quantity'],
				'valor'      => $item['total'] / $item['quantity'],
				'frete'      => 0, 
				'weight'     => $item['weight'], 
			);
		}

		list($ddd, $telefone) = $this->trataTelefone($order['telephone']);
		$street = explode(',',$order['shipping_address_1']);            
		$street = array_slice(array_merge($street, array("","","")),0,3); 
		list($endereco, $numero, $complemento) = $street;      
        
		$cliente = array (
			'nome'   => $order['payment_firstname'].' '.$order['payment_lastname'],
			'cep'    => $order['payment_postcode'],
			'end'    => $endereco,
			'num'    => $numero,
			'compl'  => $complemento,
			'cidade' => $order['payment_city'],
			'uf'     => $order['payment_zone'],
			'pais'   => $order['payment_country'],
			'ddd'    => $ddd,
			'tel'    => $telefone,
			'email'  => $order['email'],
			);
		
		/*Pega cupom e calcula o desconto*/
		if(isset($this->session->data['coupon']) && $this->session->data['coupon']){	
			$coupon =  $this->model_checkout_coupon->getCoupon($this->session->data['coupon']);
			$extras = 0;
			if(count($coupon['product']) > 0){
				foreach ($this->cart->getProducts() as $products) {
					if(in_array($products['product_id'],$coupon['product'])){
						if($coupon['type'] == 'F'){
							$extra = $coupon['discount'] > $products['total'] ? $products['total'] : $coupon['discount'];
						}elseif($coupon['type'] == 'P'){		
							$extra = ($products['total'] * $coupon['discount']) / 100;
							$extra = $extra > $products['total'] ? $products['total'] : $extra;
						}
						$extras += $extra;
					}
				}
			}else{
				if($coupon['type'] == 'F'){
					$extras = $coupon['discount'] > $this->cart->getTotal() ? $this->cart->getTotal() : $coupon['discount'];
				}elseif($coupon['type'] == 'P'){			
					$extras = ($this->cart->getTotal() * $coupon['discount']) / 100;
					$extras = $extras > $this->cart->getTotal() ? $this->cart->getTotal() : $extras;
				}
			}
			$extras = $this->cart->getTotal() - $extras == 0 ? $extras - 0.01 : $extras;
			$extras = sprintf("%01.2f", $extras);
			$extras = str_replace('.','',$extras*100);
			
		}else{
			$extras = 0;
		}
		
		/*echo '<pre>';
		print_r($this->session->data['shipping_method']);
		echo '</pre>';
		
		die();*/
		
		$form_final = '<form target="'.$this->config->get('meucheckout_target').'" action="https://www.meucheckout.com.br/Transactional/Order/Index" method="post" name="pagamento">  
							<input type="hidden" name="merchant_id"  value="'.$this->config->get('meucheckout_convenio').'"> 
							<input type="hidden" name="order_number"  value="'.$this->session->data['order_id'].'">';
		$i=1;
		foreach($produtos as $key=>$value){
			if(!isset($produtos[$key]['weight']) || $produtos[$key]['weight'] <= 0){
				$produtos[$key]['weight'] = 1;
			}
			$form_final .= '<input type="hidden" name="cart_'.$i.'_name" value="'.$produtos[$key]['descricao'].'" />';
			$form_final .= '<input type="hidden" name="cart_'.$i.'_unitprice" value="'.str_replace('.','',$produtos[$key]['valor']*100).'" />';
			$form_final .= '<input type="hidden" name="cart_'.$i.'_quantity" value="'.$produtos[$key]['quantidade'].'" />';
			$form_final .= '<input type="hidden" name="cart_'.$i.'_weight" value="'.$produtos[$key]['weight'].'" />';
			$form_final .= '<input type="hidden" name="cart_'.$i.'_zipcode" value="'.$order['payment_postcode'].'" />';
			$form_final .= '<input type="hidden" name="cart_'.$i.'_type" value="1" />';
			$i++;
		}
		if (isset($this->session->data['shipping_method'])) {
		    if($this->session->data['shipping_method']['code'] == 'pickup.pickup'){
				$form_final .= '<input type="hidden" name="shipping_type"  value="4">';
			}else if($this->session->data['shipping_method']['code'] == 'free.free'){
				$form_final .= '<input type="hidden" name="shipping_type"  value="3">';
			}else{
				$metodo = $this->session->data['shipping_method']['code'];
				$metodo = explode('.', $metodo);
				if($metodo[0] == 'ati_shipping_by_zip'){
					if($this->session->data['shipping_method']['cost'] == 0){
						$form_final .= '<input type="hidden" name="shipping_type"  value="3">';
					}else{
						$form_final .= '<input type="hidden" name="shipping_type"  value="2">';
						$form_final .= '<input type="hidden" name="shipping_1_name" value="'.$this->session->data['shipping_method']['title'].'" />';
						$form_final .= '<input type="hidden" name="shipping_1_price" value="'.str_replace('.','',$this->session->data['shipping_method']['cost']).'" />';
						$form_final .= '<input type="hidden" name="shipping_1_zipcode" value="'.$order['payment_postcode'].'" />';
					}
				}else{
					$form_final .= '<input type="hidden" name="shipping_type"  value="2">';
					$form_final .= '<input type="hidden" name="shipping_1_name" value="'.$this->session->data['shipping_method']['title'].'" />';
					$form_final .= '<input type="hidden" name="shipping_1_price" value="'.str_replace('.','',$this->session->data['shipping_method']['cost']).'" />';
					$form_final .= '<input type="hidden" name="shipping_1_zipcode" value="'.$order['payment_postcode'].'" />';
				}
			}
		}else{
			$form_final .= '<input type="hidden" name="shipping_type"  value="1">';
		}
		if($extras > 0){
			$form_final .= '<input type="hidden" name="discount_type"  value="1">';
			$form_final .= '<input type="hidden" name="discount_value" value="'.$extras.'" />';
		}
		$form_final .= '<input type="hidden" name="customer_name"  value="'.$cliente['nome'].'"> 
						<input type="hidden" name="customer_email"  value="'.$cliente['email'].'">
						<input type="hidden" name="customer_phone"  value="'.$cliente['ddd'].$cliente['tel'].'">
					</form>';
		$this->form = $form_final;
		$this->id = 'payment';
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/meucheckout.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/meucheckout.tpl';
		} else {
			$this->template = 'default/template/payment/meucheckout.tpl';
		}		
		$this->render(); 
	}

	private function trataTelefone($tel){
	  $tel=preg_replace('/[a-w]+.*/','',$tel);
	  $numeros=preg_replace('/\D/','',$tel);
	  $telefone=substr($numeros,sizeof($numeros)-9);
	  $ddd=substr($numeros,sizeof($numeros)-11,2);
	  $retorno=array($ddd,$telefone);
	  return $retorno;
	}
	
    /**
     * confirm - é executado quando se clica no botão de confirm
     * 
     * @access public
     * @return void
     */
	public function confirm() {
		$this->language->load('payment/meucheckout');
		
		$this->load->model('checkout/order');
		$comment  = $this->language->get('text_aguarda');
		
		$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('meucheckout_order_status_id'), $comment);
	}
}
