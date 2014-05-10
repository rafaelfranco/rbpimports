<?php 
class ControllerPaymentBoletoItau extends Controller {
private $error = array(); 

public function index() {
$titulo = 'Boleto Banco Itau';
$this->load->model('setting/setting');
$this->document->setTitle($titulo);

if ($this->request->server['REQUEST_METHOD'] == 'POST') {
$this->load->model('setting/setting');
$this->model_setting_setting->editSetting('boletoitau', $this->request->post);				
$this->session->data['success'] = 'Dados foram salvos com sucesso!';
$this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
}

if (isset($this->error['warning'])) {
$this->data['error_warning'] = $this->error['warning'];
} else {
$this->data['error_warning'] = '';
}

if (isset($this->error['email'])) {
$this->data['error_email'] = $this->error['email'];
} else {
$this->data['error_email'] = '';
}
		
if (isset($this->error['encryption'])) {
$this->data['error_encryption'] = $this->error['encryption'];
} else {
$this->data['error_encryption'] = '';
}

$this->document->breadcrumbs = array();

$this->document->breadcrumbs[] = array(
 'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
 'text'      => 'Inicial',
 'separator' => FALSE
 );

$this->document->breadcrumbs[] = array(
 'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
 'text'      => 'Pagamentos',
 'separator' => ' :: '
 );

$this->document->breadcrumbs[] = array(
 'href'      => $this->url->link('payment/boletoitau', 'token=' . $this->session->data['token'], 'SSL'),
 'text'      => 'Boleto Itau',
 'separator' => ' :: '
 );
				

$this->data['action'] = $this->url->link('payment/boletoitau', 'token=' . $this->session->data['token'], 'SSL');
$this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

$this->load->model('localisation/order_status');
		
if (isset($this->request->post['boletoitau_sort_order'])) {
$this->data['boletoitau_sort_order'] = $this->request->post['boletoitau_sort_order'];
} else {
$this->data['boletoitau_sort_order'] = $this->config->get('boletoitau_sort_order'); 
}

if (isset($this->request->post['boletoitau_nome'])) {
$this->data['boletoitau_nome'] = $this->request->post['boletoitau_nome'];
} else {
$this->data['boletoitau_nome'] = $this->config->get('boletoitau_nome'); 
} 

if (isset($this->request->post['boletoitau_status'])) {
$this->data['boletoitau_status'] = $this->request->post['boletoitau_status'];
} else {
$this->data['boletoitau_status'] = $this->config->get('boletoitau_status'); 
} 


if (isset($this->request->post['boletoitau_desconto'])) {
$this->data['boletoitau_desconto'] = $this->request->post['boletoitau_desconto'];
} else {
$this->data['boletoitau_desconto'] = $this->config->get('boletoitau_desconto'); 
}  

if (isset($this->request->post['boletoitau_padrao'])) {
$this->data['boletoitau_padrao'] = $this->request->post['boletoitau_padrao'];
} else {
$this->data['boletoitau_padrao'] = $this->config->get('boletoitau_padrao'); 
} 

$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

if (isset($this->request->post['boletoitau_geo_zone_id'])) {
$this->data['boletoitau_geo_zone_id'] = $this->request->post['boletoitau_geo_zone_id'];
} else {
$this->data['boletoitau_geo_zone_id'] = $this->config->get('boletoitau_geo_zone_id'); 
} 

if (isset($this->request->post['boletoitau_cedente'])) {
$this->data['boletoitau_cedente'] = $this->request->post['boletoitau_cedente'];
} else {
$this->data['boletoitau_cedente'] = $this->config->get('boletoitau_cedente'); 
} 

if (isset($this->request->post['boletoitau_agencia'])) {
$this->data['boletoitau_agencia'] = $this->request->post['boletoitau_agencia'];
} else {
$this->data['boletoitau_agencia'] = $this->config->get('boletoitau_agencia'); 
} 

if (isset($this->request->post['boletoitau_conta'])) {
$this->data['boletoitau_conta'] = $this->request->post['boletoitau_conta'];
} else {
$this->data['boletoitau_conta'] = $this->config->get('boletoitau_conta'); 
} 

if (isset($this->request->post['boletoitau_agenciadv'])) {
$this->data['boletoitau_agenciadv'] = $this->request->post['boletoitau_agenciadv'];
} else {
$this->data['boletoitau_agenciadv'] = $this->config->get('boletoitau_agenciadv'); 
} 



if (isset($this->request->post['boletoitau_conta'])) {
$this->data['boletoitau_contadv'] = $this->request->post['boletoitau_contadv'];
} else {
$this->data['boletoitau_contadv'] = $this->config->get('boletoitau_contadv'); 
} 

if (isset($this->request->post['boletoitau_carteira'])) {
$this->data['boletoitau_carteira'] = $this->request->post['boletoitau_carteira'];
} else {
$this->data['boletoitau_carteira'] = $this->config->get('boletoitau_carteira'); 
} 

if (isset($this->request->post['boletoitau_demo1'])) {
$this->data['boletoitau_demo1'] = $this->request->post['boletoitau_demo1'];
} else {
$this->data['boletoitau_demo1'] = $this->config->get('boletoitau_demo1'); 
} 

if (isset($this->request->post['boletoitau_demo2'])) {
$this->data['boletoitau_demo2'] = $this->request->post['boletoitau_demo2'];
} else {
$this->data['boletoitau_demo2'] = $this->config->get('boletoitau_demo2'); 
} 

if (isset($this->request->post['boletoitau_demo3'])) {
$this->data['boletoitau_demo3'] = $this->request->post['boletoitau_demo3'];
} else {
$this->data['boletoitau_demo3'] = $this->config->get('boletoitau_demo3'); 
} 

if (isset($this->request->post['boletoitau_instrucao1'])) {
$this->data['boletoitau_instrucao1'] = $this->request->post['boletoitau_instrucao1'];
} else {
$this->data['boletoitau_instrucao1'] = $this->config->get('boletoitau_instrucao1'); 
} 

if (isset($this->request->post['boletoitau_instrucao2'])) {
$this->data['boletoitau_instrucao2'] = $this->request->post['boletoitau_instrucao2'];
} else {
$this->data['boletoitau_instrucao2'] = $this->config->get('boletoitau_instrucao2'); 
} 

if (isset($this->request->post['boletoitau_instrucao3'])) {
$this->data['boletoitau_instrucao3'] = $this->request->post['boletoitau_instrucao3'];
} else {
$this->data['boletoitau_instrucao3'] = $this->config->get('boletoitau_instrucao3'); 
}

if (isset($this->request->post['boletoitau_instrucao4'])) {
$this->data['boletoitau_instrucao4'] = $this->request->post['boletoitau_instrucao4'];
} else {
$this->data['boletoitau_instrucao4'] = $this->config->get('boletoitau_instrucao4'); 
} 



if (isset($this->request->post['boletoitau_cpf'])) {
$this->data['boletoitau_cpf'] = $this->request->post['boletoitau_cpf'];
} else {
$this->data['boletoitau_cpf'] = $this->config->get('boletoitau_cpf'); 
} 

if (isset($this->request->post['boletoitau_vencimento'])) {
$this->data['boletoitau_vencimento'] = $this->request->post['boletoitau_vencimento'];
} else {
$this->data['boletoitau_vencimento'] = $this->config->get('boletoitau_vencimento'); 
} 
		
$this->load->model('localisation/geo_zone');
										
$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
$this->template = 'payment/boletoitau.tpl';
$this->children = array(
'common/header',	
'common/footer'	
);
		
$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
}

	
}
?>