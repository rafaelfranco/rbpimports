<?php
class ControllerPaymentAdyen extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('payment/adyen');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('adyen', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_all_zones'] = $this->language->get('text_all_zones');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_loja'] = $this->language->get('text_loja');
		$this->data['text_administradora'] = $this->language->get('text_administradora');

		$this->data['entry_total'] = $this->language->get('entry_total');
		$this->data['entry_afiliacao'] = $this->language->get('entry_afiliacao');
		$this->data['entry_teste'] = $this->language->get('entry_teste');
		$this->data['entry_login'] = $this->language->get('entry_login');
		$this->data['entry_password'] = $this->language->get('entry_password');
		$this->data['entry_parcelamento'] = $this->language->get('entry_parcelamento');
		$this->data['entry_cartao_visa'] = $this->language->get('entry_cartao_visa');
		$this->data['entry_cartao_amex'] = $this->language->get('entry_cartao_amex');
		$this->data['entry_cartao_mastercard'] = $this->language->get('entry_cartao_mastercard');
		$this->data['entry_cartao_diners'] = $this->language->get('entry_cartao_diners');
		$this->data['entry_cartao_discover'] = $this->language->get('entry_cartao_discover');
		$this->data['entry_cartao_elo'] = $this->language->get('entry_cartao_elo');
		$this->data['entry_parcelas'] = $this->language->get('entry_parcelas');
		$this->data['entry_cartao_minimo'] = $this->language->get('entry_cartao_minimo');
		$this->data['entry_cartao_semjuros'] = $this->language->get('entry_cartao_semjuros');
		$this->data['entry_cartao_juros'] = $this->language->get('entry_cartao_juros');
		$this->data['entry_aprovado'] = $this->language->get('entry_aprovado');
		$this->data['entry_nao_aprovado'] = $this->language->get('entry_nao_aprovado');
		$this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

   		if (isset($this->error['adyen_afiliacao'])) {
			$this->data['error_afiliacao'] = $this->error['adyen_afiliacao'];
		} else {
			$this->data['error_afiliacao'] = '';
		}
		
		if (isset($this->error['adyen_login'])) {
			$this->data['error_login'] = $this->error['adyen_login'];
		} else {
			$this->data['error_login'] = '';
		}
		
		if (isset($this->error['adyen_password'])) {
			$this->data['error_password'] = $this->error['adyen_password'];
		} else {
			$this->data['error_password'] = '';
		}

 		if (isset($this->error['adyen_cartao_semjuros'])) {
			$this->data['error_cartao_semjuros'] = $this->error['adyen_cartao_semjuros'];
		} else {
			$this->data['error_cartao_semjuros'] = '';
		}

 		if (isset($this->error['adyen_cartao_juros'])) {
			$this->data['error_cartao_juros'] = $this->error['adyen_cartao_juros'];
		} else {
			$this->data['error_cartao_juros'] = '';
		}

 		if (isset($this->error['adyen_cartao_minimo'])) {
			$this->data['error_cartao_minimo'] = $this->error['adyen_cartao_minimo'];
		} else {
			$this->data['error_cartao_minimo'] = '';
		}

		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),      		
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/adyen', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$this->data['action'] = $this->url->link('payment/adyen', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['adyen_total'])) {
			$this->data['adyen_total'] = $this->request->post['adyen_total'];
		} else {
			$this->data['adyen_total'] = $this->config->get('adyen_total');
		}
		
		if (isset($this->request->post['adyen_afiliacao'])) {
			$this->data['adyen_afiliacao'] = $this->request->post['adyen_afiliacao'];
		} else {
			$this->data['adyen_afiliacao'] = $this->config->get('adyen_afiliacao');
		}

		if (isset($this->request->post['adyen_login'])) {
			$this->data['adyen_login'] = $this->request->post['adyen_login'];
		} else {
			$this->data['adyen_login'] = $this->config->get('adyen_login');
		}	

		if (isset($this->request->post['adyen_password'])) {
			$this->data['adyen_password'] = $this->request->post['adyen_password'];
		} else {
			$this->data['adyen_password'] = $this->config->get('adyen_password');
		}			

		if (isset($this->request->post['adyen_teste'])) {
			$this->data['adyen_teste'] = $this->request->post['adyen_teste'];
		} else {
			$this->data['adyen_teste'] = $this->config->get('adyen_teste');
		}
		
		if (isset($this->request->post['adyen_parcelamento'])) {
			$this->data['adyen_parcelamento'] = $this->request->post['adyen_parcelamento'];
		} else {
			$this->data['adyen_parcelamento'] = $this->config->get('adyen_parcelamento');
		}

		if (isset($this->request->post['adyen_cartao_visa'])) {
			$this->data['adyen_cartao_visa'] = $this->request->post['adyen_cartao_visa'];
		} else {
			$this->data['adyen_cartao_visa'] =  $this->config->get('adyen_cartao_visa');
		}

		if (isset($this->request->post['adyen_cartao_amex'])) {
			$this->data['adyen_cartao_amex'] = $this->request->post['adyen_cartao_amex'];
		} else {
			$this->data['adyen_cartao_amex'] =  $this->config->get('adyen_cartao_amex');
		}

		if (isset($this->request->post['adyen_cartao_mastercard'])) {
			$this->data['adyen_cartao_mastercard'] = $this->request->post['adyen_cartao_mastercard'];
		} else {
			$this->data['adyen_cartao_mastercard'] =  $this->config->get('adyen_cartao_mastercard');
		}

		if (isset($this->request->post['adyen_cartao_diners'])) {
			$this->data['adyen_cartao_diners'] = $this->request->post['adyen_cartao_diners'];
		} else {
			$this->data['adyen_cartao_diners'] =  $this->config->get('adyen_cartao_diners');
		}

		if (isset($this->request->post['adyen_cartao_discover'])) {
			$this->data['adyen_cartao_discover'] = $this->request->post['adyen_cartao_discover'];
		} else {
			$this->data['adyen_cartao_discover'] =  $this->config->get('adyen_cartao_discover');
		}

		if (isset($this->request->post['adyen_cartao_elo'])) {
			$this->data['adyen_cartao_elo'] = $this->request->post['adyen_cartao_elo'];
		} else {
			$this->data['adyen_cartao_elo'] =  $this->config->get('adyen_cartao_elo');
		}

		if (isset($this->request->post['adyen_visa_parcelas'])) {
			$this->data['adyen_visa_parcelas'] = $this->request->post['adyen_visa_parcelas'];
		} else {
			$this->data['adyen_visa_parcelas'] =  $this->config->get('adyen_visa_parcelas');
		}

		if (isset($this->request->post['adyen_amex_parcelas'])) {
			$this->data['adyen_amex_parcelas'] = $this->request->post['adyen_amex_parcelas'];
		} else {
			$this->data['adyen_amex_parcelas'] =  $this->config->get('adyen_amex_parcelas');
		}

		if (isset($this->request->post['adyen_mastercard_parcelas'])) {
			$this->data['adyen_mastercard_parcelas'] = $this->request->post['adyen_mastercard_parcelas'];
		} else {
			$this->data['adyen_mastercard_parcelas'] =  $this->config->get('adyen_mastercard_parcelas');
		}

		if (isset($this->request->post['adyen_diners_parcelas'])) {
			$this->data['adyen_diners_parcelas'] = $this->request->post['adyen_diners_parcelas'];
		} else {
			$this->data['adyen_diners_parcelas'] =  $this->config->get('adyen_diners_parcelas');
		}

		if (isset($this->request->post['adyen_discover_parcelas'])) {
			$this->data['adyen_discover_parcelas'] = $this->request->post['adyen_discover_parcelas'];
		} else {
			$this->data['adyen_discover_parcelas'] =  $this->config->get('adyen_discover_parcelas');
		}

		if (isset($this->request->post['adyen_elo_parcelas'])) {
			$this->data['adyen_elo_parcelas'] = $this->request->post['adyen_elo_parcelas'];
		} else {
			$this->data['adyen_elo_parcelas'] =  $this->config->get('adyen_elo_parcelas');
		}

		if (isset($this->request->post['adyen_cartao_semjuros'])) {
			$this->data['adyen_cartao_semjuros'] = $this->request->post['adyen_cartao_semjuros'];
		} else {
			$this->data['adyen_cartao_semjuros'] = $this->config->get('adyen_cartao_semjuros');
		}

		if (isset($this->request->post['adyen_cartao_minimo'])) {
			$this->data['adyen_cartao_minimo'] = $this->request->post['adyen_cartao_minimo'];
		} else {
			$this->data['adyen_cartao_minimo'] = $this->config->get('adyen_cartao_minimo');
		}

		if (isset($this->request->post['adyen_cartao_juros'])) {
			$this->data['adyen_cartao_juros'] = $this->request->post['adyen_cartao_juros'];
		} else {
			$this->data['adyen_cartao_juros'] = $this->config->get('adyen_cartao_juros');
		}
		
		$this->load->model('localisation/order_status');

		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		if (isset($this->request->post['adyen_aprovado_id'])) {
			$this->data['adyen_aprovado_id'] = $this->request->post['adyen_aprovado_id'];
		} else {
			$this->data['adyen_aprovado_id'] = $this->config->get('adyen_aprovado_id'); 
		}
		
		if (isset($this->request->post['adyen_nao_aprovado_id'])) {
			$this->data['adyen_nao_aprovado_id'] = $this->request->post['adyen_nao_aprovado_id'];
		} else {
			$this->data['adyen_nao_aprovado_id'] = $this->config->get('adyen_nao_aprovado_id'); 
		}
		
		$this->load->model('localisation/geo_zone');

		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['adyen_geo_zone_id'])) {
			$this->data['adyen_geo_zone_id'] = $this->request->post['adyen_geo_zone_id'];
		} else {
			$this->data['adyen_geo_zone_id'] = $this->config->get('adyen_geo_zone_id');
		}		

		if (isset($this->request->post['adyen_status'])) {
			$this->data['adyen_status'] = $this->request->post['adyen_status'];
		} else {
			$this->data['adyen_status'] = $this->config->get('adyen_status');
		}

		if (isset($this->request->post['adyen_sort_order'])) {
			$this->data['adyen_sort_order'] = $this->request->post['adyen_sort_order'];
		} else {
			$this->data['adyen_sort_order'] = $this->config->get('adyen_sort_order');
		}

		$this->template = 'payment/adyen.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/adyen')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['adyen_afiliacao']) {
			$this->error['adyen_afiliacao'] = $this->language->get('error_afiliacao');
		}
		
		if (!$this->request->post['adyen_login']) {
			$this->error['adyen_login'] = $this->language->get('error_login');
		}
		
		if (!$this->request->post['adyen_password']) {
			$this->error['adyen_password'] = $this->language->get('error_password');
		}

		if (!$this->request->post['adyen_cartao_semjuros']) {
			$this->error['adyen_cartao_semjuros'] = $this->language->get('error_cartao_semjuros');
		}

		if (!$this->request->post['adyen_cartao_juros']) {
			$this->error['adyen_cartao_juros'] = $this->language->get('error_cartao_juros');
		}

		if (!$this->request->post['adyen_cartao_minimo']) {
			$this->error['adyen_cartao_minimo'] = $this->language->get('error_cartao_minimo');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>