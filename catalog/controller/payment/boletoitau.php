<?php
class ControllerPaymentboletoitau extends Controller {
  protected function index() {
    $this->data['button_confirm'] = 'Confirmar';
	$this->data['button_back'] = 'Voltar';

	
	$this->load->model('checkout/order');
	$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
    $this->data['pedido'] = $order_info['order_id'];
	
	$this->data['desconto'] = $this->config->get('boletoitau_desconto');
	$this->data['valorpedido'] = $order_info['total'];
	
    $this->data['back'] = HTTPS_SERVER . 'index.php?route=checkout/payment';
    $this->data['continue'] = HTTPS_SERVER . 'index.php?route=checkout/success';
    if ($this->request->get['route'] != 'checkout/guest_step_3') {
 	 $this->data['back'] = HTTPS_SERVER . 'index.php?route=checkout/payment';
    } else {
      $this->data['back'] = HTTPS_SERVER . 'index.php?route=checkout/guest_step_2';
    }	
    $this->id = 'payment';
    if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/boletoitau.tpl')) {
	  $this->template = $this->config->get('config_template') . '/template/payment/boletoitau.tpl';
	} else {
	  $this->template = 'default/template/payment/boletoitau.tpl';
	}	
	$this->render();
  }

  public function confirm() {
		$this->load->library('encryption');
		
		$encryption = new Encryption($this->config->get('config_encryption'));
		$order_id = $encryption->encrypt($this->session->data['order_id']);

		$this->load->model('checkout/order');

		$comment  = "Boleto Bancario Gerado<br>";
		$comment .= "Aguardando Confirmacao de Pagamento.<br>";
		$comment .= '<br>Para Gera o Boleto Novamente Clique em:<br>';
		$comment .= '<a href="'.HTTPS_SERVER.'boletos/boletoitau/boleto_itau.php?boleto='.$this->session->data['order_id'].'" target="_blank">
<img src="'.HTTPS_SERVER.'/image/gerar_boleto.gif" border="0"></a>';
		
		$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('boletoitau_padrao'), $comment, true);

				$this->cart->clear();
        $ouput = "<script>window.location = 'index.php?route=checkout/success';</script>";  
		$this->response->setOutput($ouput);
	}
	
	
	
	
  
}
?>

